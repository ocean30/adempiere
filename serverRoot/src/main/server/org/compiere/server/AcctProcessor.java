/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.compiere.server;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;

import org.compiere.acct.Doc;
import org.compiere.model.MAcctProcessor;
import org.compiere.model.MAcctProcessorLog;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MBankStatement;
import org.compiere.model.MClient;
import org.compiere.model.MCost;
import org.compiere.model.MInventory;
import org.compiere.model.MInvoice;
import org.compiere.model.MMovement;
import org.compiere.model.MProduction;
import org.compiere.model.MProjectIssue;
import org.compiere.model.MRequisition;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.TimeUtil;
import org.compiere.util.Trx;
import org.eevolution.model.X_DD_Order;
import org.eevolution.model.X_PP_Order;


/**
 *	Accounting Processor
 *	
 *  @author Jorg Janke
 *  @version $Id: AcctProcessor.java,v 1.3 2006/07/30 00:53:33 jjanke Exp $
 */
public class AcctProcessor extends AdempiereServer
{
	/**
	 * 	Accounting Processor
	 *	@param model model 
	 */
	public AcctProcessor (MAcctProcessor model)
	{
		super (model, 30);	//	30 seconds delay
		m_model = model;
		m_client = MClient.get(model.getCtx(), model.getAD_Client_ID());
	}	//	AcctProcessor

	/**	The Concrete Model			*/
	private MAcctProcessor		m_model = null;
	/**	Last Summary				*/
	private StringBuffer 		m_summary = new StringBuffer();
	/** Client onfo					*/
	private MClient 			m_client = null;
	/**	Accounting Schemata			*/
	private MAcctSchema[] 		m_ass = null;
	
	/**
	 * 	Work
	 */
	protected void doWork ()
	{
		m_summary = new StringBuffer();
		//	Get Schemata
		if (m_model.getC_AcctSchema_ID() == 0)
			m_ass = MAcctSchema.getClientAcctSchema(getCtx(), m_model.getAD_Client_ID());
		else	//	only specific accounting schema
			m_ass = new MAcctSchema[] {new MAcctSchema (getCtx(), m_model.getC_AcctSchema_ID(), null)};
		//
		postSession();
		MCost.create(m_client);
		//
		int no = m_model.deleteLog();
		m_summary.append("Logs deleted=").append(no);
		//
		MAcctProcessorLog pLog = new MAcctProcessorLog(m_model, m_summary.toString());
		pLog.setReference("#" + String.valueOf(p_runCount) 
			+ " - " + TimeUtil.formatElapsed(new Timestamp(p_startWork)));
		pLog.saveEx();
	}	//	doWork

	/**
	 * 	Post Session
	 */
	private void postSession()
	{
		List<BigDecimal> listProcessedOn = new ArrayList<BigDecimal>();
		for (Timestamp dateacct:getListDateacct())
		{
			listProcessedOn.clear();
			listProcessedOn.add(Env.ZERO); // to include potential null values

			//get current time from db
			Timestamp ts = DB.getSQLValueTS(null, "SELECT CURRENT_TIMESTAMP FROM DUAL");
			//go back 2 second to be safe (to avoid posting documents being completed at this precise moment)
			long ms = ts.getTime()- (2 * 1000);
			ts = new Timestamp(ms);
			long mili = ts.getTime();
			BigDecimal value = new BigDecimal(Long.toString(mili));

			//first pass, collect all ts (FR 2962094 - required for weighted average costing)
			int[] documentsTableID = Doc.getDocumentsTableID();
			String[] documentsTableName = Doc.getDocumentsTableName();
			for (int i = 0; i < documentsTableID.length; i++)
			{
				int AD_Table_ID = documentsTableID[i];
				String TableName = documentsTableName[i];
				//	Post only special documents
				if (m_model.getAD_Table_ID() != 0
						&& m_model.getAD_Table_ID() != AD_Table_ID)
					continue;

				StringBuffer sql = new StringBuffer ("SELECT DISTINCT ProcessedOn FROM ").append(TableName)
						.append(" WHERE AD_Client_ID=? AND ProcessedOn<?")
						.append(" AND Processed='Y' AND Posted='N' AND IsActive='Y' and " + getColumnnameDateacct(AD_Table_ID) + "  = ? ");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try
				{
					pstmt = DB.prepareStatement(sql.toString(), null);
					pstmt.setInt(1, m_model.getAD_Client_ID());
					pstmt.setBigDecimal(2, value);
					pstmt.setTimestamp(3, dateacct);
					rs = pstmt.executeQuery();
					while (rs.next())
					{
						BigDecimal processedOn = rs.getBigDecimal(1);
						if (!listProcessedOn.contains(processedOn))
							listProcessedOn.add(processedOn);
					}
				}
				catch (Exception e)
				{
					log.log(Level.SEVERE, sql.toString(), e);
				}
				finally
				{
					DB.close(rs, pstmt);
				}
			}

			// initialize counters per table
			int[] count = new int[documentsTableID.length];
			int[] countError = new int[documentsTableID.length];
			for (int i = 0; i < count.length; i++) {
				count[i] = 0;
				countError[i] = 0;
			}

			//sort and post in the processed date order
			Collections.sort(listProcessedOn);
			for (BigDecimal processedOn : listProcessedOn)
			{

				for (int i = 0; i < documentsTableID.length; i++)
				{
					int AD_Table_ID = documentsTableID[i];
					String TableName = documentsTableName[i];
					//	Post only special documents
					if (m_model.getAD_Table_ID() != 0
							&& m_model.getAD_Table_ID() != AD_Table_ID)
						continue;
					//  SELECT * FROM table
					StringBuffer sql = new StringBuffer ("SELECT * FROM ").append(TableName)
							.append(" WHERE AD_Client_ID=? AND (ProcessedOn");
					if (processedOn.compareTo(Env.ZERO) != 0)
						sql.append("=?");
					else
						sql.append(" IS NULL OR ProcessedOn=0");
					sql.append(") AND Processed='Y' AND Posted='N' AND IsActive='Y'")
					.append(" ORDER BY Created");
					//
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try
					{
						pstmt = DB.prepareStatement(sql.toString(), null);
						pstmt.setInt(1, m_model.getAD_Client_ID());
						if (processedOn.compareTo(Env.ZERO) != 0)
							pstmt.setBigDecimal(2, processedOn);
						rs = pstmt.executeQuery();
						while (rs.next())
						{
							count[i]++;
							boolean ok = true;
							// Run every posting document in own transaction
							String innerTrxName = Trx.createTrxName("CAP");
							Trx innerTrx = Trx.get(innerTrxName, true);
							String postStatus = Doc.STATUS_NotPosted; 
							Doc doc = Doc.get (m_ass, AD_Table_ID, rs, innerTrxName);
							try
							{
								if (doc == null)
								{
									log.severe(getName() + ": No Doc for " + TableName);
									ok = false;
								}
								else
								{
									String error = doc.post(false, false);   //  post no force/repost
									ok = (error == null);
									postStatus = doc.getPostStatus();
								}
							}
							catch (Exception e)
							{
								log.log(Level.SEVERE, getName() + ": " + TableName, e);
								ok = false;
							}
							finally
							{
								if (ok)
									innerTrx.commit();
								else {
									innerTrx.rollback();
									// save the posted status error (out of trx)
									StringBuffer sqlupd = new StringBuffer("UPDATE ")
									.append(doc.get_TableName()).append(" SET Posted='").append(postStatus)
									.append("',Processing='N' ")
									.append("WHERE ")
									.append(doc.get_TableName()).append("_ID=").append(doc.get_ID());
									DB.executeUpdateEx(sqlupd.toString(), null);
								}
								innerTrx.close();
								innerTrx = null;
							}
							if (!ok)
								countError[i]++;
						}
					}
					catch (Exception e)
					{
						log.log(Level.SEVERE, sql.toString(), e);
					}
					finally
					{
						DB.close(rs, pstmt);
					}

				} // for tableID

			} // for processedOn

			for (int i = 0; i < documentsTableID.length; i++)
			{
				String TableName = documentsTableName[i];
				if (count[i] > 0)
				{
					m_summary.append(TableName).append("=").append(count[i]);
					if (countError[i] > 0)
						m_summary.append("(Errors=").append(countError[i]).append(")");
					m_summary.append(" - ");
					log.finer(getName() + ": " + m_summary.toString());
				}
				else
					log.finer(getName() + ": " + TableName + " - no work");
			}
		}

	}	//	postSession
	
	/**
	 * 	Get Server Info
	 *	@return info
	 */
	public String getServerInfo()
	{
		return "#" + p_runCount + " - Last=" + m_summary.toString();
	}	//	getServerInfo
	

	
	private List<Timestamp> getListDateacct()
	{
		//get current time from db
		Timestamp ts = DB.getSQLValueTS(null, "SELECT CURRENT_TIMESTAMP FROM DUAL");
		//go back 2 second to be safe (to avoid posting documents being completed at this precise moment)
		long ms = ts.getTime()- (2 * 1000);
		ts = new Timestamp(ms);
		long mili = ts.getTime();
		BigDecimal value = new BigDecimal(Long.toString(mili));

		List<Timestamp> listDateAcct = new ArrayList<Timestamp>();

		//get current time from db
		
		//first pass, collect all ts (FR 2962094 - required for weighted average costing)
		int[] documentsTableID = Doc.getDocumentsTableID();
		String[] documentsTableName = Doc.getDocumentsTableName();
		for (int i = 0; i < documentsTableID.length; i++)
		{
			int AD_Table_ID = documentsTableID[i];
			String TableName = documentsTableName[i];
			//	Post only special documents
			if (m_model.getAD_Table_ID() != 0
				&& m_model.getAD_Table_ID() != AD_Table_ID)
				continue;
			
			StringBuffer sql = new StringBuffer ("SELECT DISTINCT " + getColumnnameDateacct(AD_Table_ID) +" FROM ").append(TableName)
				.append(" WHERE AD_Client_ID=? ")
				.append(" AND Processed='Y' AND Posted='N' AND IsActive='Y'");
				//.append(" and " + getColumnnameDateacct(AD_Table_ID)+ " < to_date('31/01/2012','dd/mm/yyyy')");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try
			{
				pstmt = DB.prepareStatement(sql.toString(), null);
				pstmt.setInt(1, m_model.getAD_Client_ID());
				//pstmt.setBigDecimal(2, value);
				rs = pstmt.executeQuery();
				while (rs.next())
				{
					Timestamp dateacct = rs.getTimestamp(1);
					if (!listDateAcct.contains(dateacct))
						listDateAcct.add(dateacct);
				}
			}
			catch (Exception e)
			{
				log.log(Level.SEVERE, sql.toString(), e);
			}
			finally
			{
				DB.close(rs, pstmt);
			}
		}

		  Collections.sort(listDateAcct);
		  return listDateAcct;
	}

	private String getColumnnameDateacct(int AD_Table_ID)
	{
		if (AD_Table_ID == 392)
			return MBankStatement.COLUMNNAME_StatementDate;
		if (AD_Table_ID == 623)
			return MProjectIssue.COLUMNNAME_MovementDate;
		if (AD_Table_ID == 321)
			return MInventory.COLUMNNAME_MovementDate;
		if (AD_Table_ID == 323)
			return MMovement.COLUMNNAME_MovementDate;
		if (AD_Table_ID == 325)
			return MProduction.COLUMNNAME_MovementDate;
		if (AD_Table_ID == 702)
			return MRequisition.COLUMNNAME_DateDoc;
		if (AD_Table_ID == 53027)
			return X_PP_Order.COLUMNNAME_DateOrdered;
		if (AD_Table_ID == 53037)
			return X_DD_Order.COLUMNNAME_DateOrdered;
		
		
		return MInvoice.COLUMNNAME_DateAcct;
	}

}	//	AcctProcessor
