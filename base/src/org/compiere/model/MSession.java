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
package org.compiere.model;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.adempiere.ad.migration.logger.IMigrationLogger;
import org.adempiere.util.Services;
import org.compiere.Adempiere;
import org.compiere.util.CCache;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.Ini;
import org.compiere.util.TimeUtil;
import org.compiere.util.Trx;
import org.compiere.util.Util;

/**
 *	Session Model.
 *	Maintained in AMenu.
 *	
 *  @author Jorg Janke
 *  @version $Id: MSession.java,v 1.3 2006/07/30 00:58:05 jjanke Exp $
 * 
 * @author Teo Sarca, SC ARHIPAC SERVICE SRL
 * 			<li>BF [ 1810182 ] Session lost after cache reset 
 * 			<li>BF [ 1892156 ] MSession is not really cached 
 */
public class MSession extends X_AD_Session
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 480745219310430126L;


	/**
	 * 	Get existing or create local session
	 *	@param ctx context
	 *	@param createNew create if not found
	 *	@return session session
	 */
	public static MSession get (Properties ctx, boolean createNew)
	{
		int AD_Session_ID = Env.getContextAsInt(ctx, "#AD_Session_ID");
		MSession session = null;
		if (AD_Session_ID > 0)
			session = (MSession)s_sessions.get(new Integer(AD_Session_ID));
		// Try to load
		if (session == null && AD_Session_ID > 0)
		{
			session = new MSession(ctx, AD_Session_ID, null);
			if (session.get_ID() != AD_Session_ID) {
				Env.setContext (ctx, "#AD_Session_ID", AD_Session_ID);
			}
			s_sessions.put(AD_Session_ID, session);
		}
		// Create New
		if (session == null && createNew)
		{
			session = new MSession (ctx, null);	//	local session
			session.saveEx();
			AD_Session_ID = session.getAD_Session_ID();
			Env.setContext (ctx, "#AD_Session_ID", AD_Session_ID);
			s_sessions.put (new Integer(AD_Session_ID), session);
		}	
		return session;
	}	//	get

	// t.schoeneberg@metas.de, task mo73_03132: extracting code, adding public method to load/chache an AD_Session by AD_Session_ID
	public static MSession get(Properties ctx, int AD_Session_ID)
	{
		return get(ctx, AD_Session_ID, false);
	}
	
	private static MSession get(Properties ctx, int AD_Session_ID, boolean updateCtx)
	{
		if (AD_Session_ID <= 0)
		{
			return null;
		}
		
		MSession session = getFromCache(ctx, AD_Session_ID);
		
		// Try to load
		if (session == null)
		{
			session = new MSession(ctx, AD_Session_ID, Trx.TRXNAME_None);
			if (session.get_ID() != AD_Session_ID)
			{
				// no session found for given AD_Session_ID, a warning shall be already logged 
				return null;
			}
			s_sessions.put(AD_Session_ID, session);
		}
		
		// Update context
		if (updateCtx)
		{
			session.updateContext(true); // force=true
		}

		
		return session;
	}
	// end of t.schoeneberg@metas.de, task mo73_03132
	
	/**
	 * 	Get existing or create remote session
	 *	@param ctx context
	 *	@param Remote_Addr remote address
	 *	@param Remote_Host remote host
	 *	@param WebSession web session
	 *	@return session
	 */
	public static MSession get (Properties ctx, String Remote_Addr, String Remote_Host, String WebSession)
	{
		int AD_Session_ID = Env.getContextAsInt(ctx, "#AD_Session_ID");
		MSession session = get(ctx, AD_Session_ID, false);
		if (session == null)
		{
			session = new MSession (ctx, Remote_Addr, Remote_Host, WebSession, Trx.TRXNAME_None);	//	remote session
			session.save();
			session.updateContext(true); // force=true
			s_sessions.put(AD_Session_ID, session);
		}	
		return session;
	}	//	get
	
	private static final MSession getFromCache(Properties ctx, int AD_Session_ID)
	{
		if (AD_Session_ID <= 0)
		{
			return null;
		}
		
		final MSession session = s_sessions.get(AD_Session_ID);
		if (session == null)
		{
			return null;
		}
		if (session.getAD_Session_ID() != AD_Session_ID)
		{
			return null;
		}
		if (!Util.equals(session.get_TrxName(), Trx.TRXNAME_None))
		{
			// Invalid transaction
			return null;
		}
		if (!Util.same(session.getCtx(), ctx))
		{
			// Session was created in a different context
			// we must check this because else we can corrupt other's context
			return null;
		}
		
		return session;
	}

	/**	Sessions					*/
	private static CCache<Integer, MSession> s_sessions = Ini.isClient() 
		? new CCache<Integer, MSession>("AD_Session_ID", 1, 0)		//	one client session 
		: new CCache<Integer, MSession>("AD_Session_ID", 30, 0);	//	no time-out	
	
	
	/**************************************************************************
	 * 	Standard Constructor
	 *	@param ctx context
	 *	@param AD_Session_ID id
	 *	@param trxName transaction
	 */
	public MSession (Properties ctx, int AD_Session_ID, String trxName)
	{
		super(ctx, AD_Session_ID, trxName);
		if (AD_Session_ID == 0)
		{
			setProcessed (false);
		}
	}	//	MSession

	/**
	 * 	Load Costructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MSession(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MSession

	/**
	 * 	New (remote) Constructor
	 *	@param ctx context
	 *	@param Remote_Addr remote address
	 *	@param Remote_Host remote host
	 *	@param WebSession web session
	 *	@param trxName transaction
	 */
	public MSession (Properties ctx, String Remote_Addr, String Remote_Host, String WebSession, String trxName)
	{
		this (ctx, 0, trxName);
		if (Remote_Addr != null)
			setRemote_Addr(Remote_Addr);
		if (Remote_Host != null)
			setRemote_Host(Remote_Host);
		if (WebSession != null)
			setWebSession(WebSession);
		setDescription(Adempiere.MAIN_VERSION + "_"
				+ Adempiere.DATE_VERSION + " "
				+ Adempiere.getImplementationVersion());
		setAD_Role_ID(Env.getContextAsInt(ctx, "#AD_Role_ID"));
		setLoginDate(Env.getContextAsDate(ctx, "#Date"));
	}	//	MSession

	/**
	 * 	New (local) Constructor
	 *	@param ctx context
	 *	@param trxName transaction
	 */
	public MSession (Properties ctx, String trxName)
	{
		this (ctx, 0, trxName);
		try
		{
			InetAddress lh = InetAddress.getLocalHost();
			setRemote_Addr(lh.getHostAddress());
			setRemote_Host(lh.getHostName());
			setDescription(Adempiere.MAIN_VERSION + "_"
					+ Adempiere.DATE_VERSION + " "
					+ Adempiere.getImplementationVersion());
			setAD_Role_ID(Env.getContextAsInt(ctx, "#AD_Role_ID"));
			setLoginDate(Env.getContextAsDate(ctx, "#Date"));
		}
		catch (UnknownHostException e)
		{
			log.log(Level.SEVERE, "No Local Host", e);
		}
	}	//	MSession

	/**	Web Store Session		*/
	private boolean		m_webStoreSession = false;
	
	/**
	 * 	Is it a Web Store Session
	 *	@return Returns true if Web Store Session.
	 */
	public boolean isWebStoreSession ()
	{
		return m_webStoreSession;
	}	//	isWebStoreSession
	
	/**
	 * 	Set Web Store Session
	 *	@param webStoreSession The webStoreSession to set.
	 */
	public void setWebStoreSession (boolean webStoreSession)
	{
		m_webStoreSession = webStoreSession;
	}	//	setWebStoreSession
	
	/**
	 * 	String Representation
	 *	@return info
	 */
	public String toString()
	{
		StringBuffer sb = new StringBuffer("MSession[")
			.append(getAD_Session_ID())
			.append(",AD_User_ID=").append(getCreatedBy())
			.append(",").append(getCreated())
			.append(",Remote=").append(getRemote_Addr());
		String s = getRemote_Host();
		if (s != null && s.length() > 0)
			sb.append(",").append(s);
		if (m_webStoreSession)
			sb.append(",WebStoreSession");
		
		// metas: display also exported attributes
		for (int i = 0, cols = get_ColumnCount(); i < cols; i++)
		{
			if (isContextAttribute(i))
			{
				final String columnName = get_ColumnName(i);
				final String value = get_ValueAsString(columnName);
				sb.append(",").append(columnName).append("=").append(value);
			}
		}
		// metas: if is in a transaction, this info is also valuable
		if (!Util.equals(get_TrxName(), Trx.TRXNAME_None))
		{
			sb.append(",trxName=" + get_TrxName());
		}
		
		sb.append("]");
		return sb.toString();
	}	//	toString

	/**
	 * 	Session Logout
	 */
	public void logout()
	{
		setProcessed(true);
		save();
		s_sessions.remove(new Integer(getAD_Session_ID()));
		log.info(TimeUtil.formatElapsed(getCreated(), getUpdated()));
	}	//	logout

	/**
	 * 	Preserved for backward compatibility
	 *@deprecated
	 */
	public MChangeLog changeLog (
		String TrxName, int AD_ChangeLog_ID,
		int AD_Table_ID, int AD_Column_ID, int Record_ID,
		int AD_Client_ID, int AD_Org_ID,
		Object OldValue, Object NewValue)
	{
		return changeLog(TrxName, AD_ChangeLog_ID, AD_Table_ID, AD_Column_ID,
				Record_ID, AD_Client_ID, AD_Org_ID, OldValue, NewValue,
				(String) null);
	}	// changeLog

	/**
	 * 	Create Change Log only if table is logged
	 * 	@param TrxName transaction name
	 *	@param AD_ChangeLog_ID 0 for new change log
	 *	@param AD_Table_ID table
	 *	@param AD_Column_ID column
	 *	@param Record_ID record
	 *	@param AD_Client_ID client
	 *	@param AD_Org_ID org
	 *	@param OldValue old
	 *	@param NewValue new
	 *	@return saved change log or null
	 */
	public MChangeLog changeLog (
		String TrxName, int AD_ChangeLog_ID,
		int AD_Table_ID, int AD_Column_ID, int Record_ID,
		int AD_Client_ID, int AD_Org_ID,
		Object OldValue, Object NewValue, String event)
	{
		//	Null handling
		if (OldValue == null && NewValue == null)
			return null;
		//	Equal Value
		if (OldValue != null && NewValue != null && OldValue.equals(NewValue))
			return null;

		//	Role Logging
		MRole role = MRole.getDefault(getCtx(), false);
		//	Do we need to log
		if (m_webStoreSession						//	log if WebStore
			|| MChangeLog.isLogged(AD_Table_ID)		//	im/explicit log
			|| (role != null && role.isChangeLog()))//	Role Logging
			;
		else
			return null;
		//
		log.finest("AD_ChangeLog_ID=" + AD_ChangeLog_ID
				+ ", AD_Session_ID=" + getAD_Session_ID()
				+ ", AD_Table_ID=" + AD_Table_ID + ", AD_Column_ID=" + AD_Column_ID
				+ ": " + OldValue + " -> " + NewValue);
		try
		{
			MChangeLog cl = new MChangeLog(getCtx(), 
				AD_ChangeLog_ID, TrxName, getAD_Session_ID(),
				AD_Table_ID, AD_Column_ID, Record_ID, AD_Client_ID, AD_Org_ID,
				OldValue, NewValue, event);
			if (cl.save())
				return cl;
		}
		catch (Exception e)
		{
			log.log(Level.SEVERE, "AD_ChangeLog_ID=" + AD_ChangeLog_ID
				+ ", AD_Session_ID=" + getAD_Session_ID()
				+ ", AD_Table_ID=" + AD_Table_ID + ", AD_Column_ID=" + AD_Column_ID, e);
			return null;
		}
		log.log(Level.SEVERE, "AD_ChangeLog_ID=" + AD_ChangeLog_ID
			+ ", AD_Session_ID=" + getAD_Session_ID()
			+ ", AD_Table_ID=" + AD_Table_ID + ", AD_Column_ID=" + AD_Column_ID);
		return null;
	}	//	changeLog
	
	public void logMigration(PO po, POInfo pinfo, String event)
	{	
		Services.get(IMigrationLogger.class).logMigration(this, po, pinfo, event);
	}

	/**
	 * Set Login User.
	 * At this moment is just updating CreatedBy column
	 * @param AD_User_ID
	 */
	// metas
	public void setAD_User_ID(int AD_User_ID)
	{
		set_ValueNoCheck(COLUMNNAME_CreatedBy, AD_User_ID);
	}
	
	/**
	 * @return Logged in user (i.e. CreatedBy)
	 */
	// metas
	public int getAD_User_ID()
	{
		return getCreatedBy();
	}
	
	
	public static final String CTX_Prefix = "#AD_Session.";

	/**
	 * Export attributes from session to context.
	 * 
	 * Used context prefix is {@link #CTX_Prefix}.
	 * 
	 * Attributes that will be exported to context are: String with FieldLength <= 60.
	 * 
	 * @param force if true, update even if current AD_Session_ID from context differs from this one.
	 * @return true if context was updated
	 */
	public boolean updateContext(boolean force)
	{
		final int sessionId = getAD_Session_ID();
		if (sessionId <= 0)
		{
			log.log(Level.WARNING, "Cannot update context because session is not saved yet");
			return false;
		}
		
		if (!isActive())
		{
			log.log(Level.FINE, "Cannot update context because session is not active");
			return false;
		}
		
		if (isProcessed())
		{
			log.log(Level.FINE, "Cannot update context because session is processed");
			return false;
		}

		
		final Properties ctx = getCtx();
		
		//
		// If not force, update the context only if the context #AD_Session_ID is same as our session ID.
		// Even if there is no value in context, the session won't be updated.
		// Keep this logic because we are calling this method on afterSave too.
		final int ctxSessionId = Env.getContextAsInt(ctx, "#AD_Session_ID");
		if (ctxSessionId != sessionId && !force)
		{
			log.log(Level.FINE, "Different AD_Session_ID found in context and force=false. Skip updating.");
			return false;
		}

		Env.setContext(ctx, "#AD_Session_ID", sessionId);
		
		final int cols = get_ColumnCount();
		for (int i = 0; i < cols; i++)
		{
			if (!isContextAttribute(i))
			{
				continue;
			}
			final String columnName = get_ColumnName(i);
			final String value = get_ValueAsString(columnName);
			Env.setContext(ctx, CTX_Prefix + columnName, value);
		}
		
		return true;
	}
	
	private boolean isContextAttribute(final int columnIndex)
	{
		if (columnIndex < 0)
		{
			return false;
		}
		
		final List<String> ignoredColumnNames = Arrays.asList(
				COLUMNNAME_AD_Session_ID // this one will be exported particularly
				, COLUMNNAME_AD_Client_ID
				, COLUMNNAME_AD_Org_ID
				, COLUMNNAME_Created
				, COLUMNNAME_CreatedBy
				, COLUMNNAME_Updated
				, COLUMNNAME_UpdatedBy
				, COLUMNNAME_IsActive
				, COLUMNNAME_Processed
				, COLUMNNAME_Remote_Addr
				, COLUMNNAME_Remote_Host
				, COLUMNNAME_WebSession);
		
		final String columnName = get_ColumnName(columnIndex);
		if(columnName == null)
		{
			return false;
		}
		
		if(ignoredColumnNames.contains(columnName))
		{
			return false;
		}
		
		final POInfo poInfo = getPOInfo();
		final int displayType = poInfo.getColumnDisplayType(columnIndex);
		if (displayType == DisplayType.String)
		{
			return poInfo.getFieldLength(columnIndex) <= 60;
		}
		
		return true;
	}

	@Override
	protected boolean afterSave(boolean newRecord, boolean success)
	{
		if (!success)
		{
			return false;
		}
		
		// Update context only if it's for same session
		updateContext(false);
		
		return true;
	}
	
	
}	//	MSession

