/******************************************************************************
 * Product: Posterita Ajax UI 												  *
 * Copyright (C) 2007 Posterita Ltd.  All Rights Reserved.                    *
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
 * Posterita Ltd., 3, Draper Avenue, Quatre Bornes, Mauritius                 *
 * or via info@posterita.org or http://www.posterita.org/                     *
 *****************************************************************************/

package org.adempiere.webui.panel;

import java.util.ArrayList;
import java.util.List;

import org.adempiere.webui.component.ConfirmPanel;
import org.adempiere.webui.component.Grid;
import org.adempiere.webui.component.Panel;
import org.adempiere.webui.component.Row;
import org.adempiere.webui.component.Rows;
import org.adempiere.webui.component.Window;
import org.adempiere.webui.window.FDialog;
import org.compiere.model.GridTab;
import org.compiere.process.DocumentEngine;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.wf.MWFActivity;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zul.Label;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;



public class WDocActionPanel extends Window implements EventListener
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Label lblDocAction;
	private Label label;
	private Listbox lstDocAction;
	
	private static GridTab gridTab;
	private static String[]		s_value = null;
	private static String[]		s_name;
	private static String[]		s_description;
	private String DocStatus; 
	private String DocAction;
	private int m_AD_Table_ID;
	private boolean m_OKpressed;
    private ConfirmPanel confirmPanel;
	
	private static final CLogger logger;
	 
    static
    {
        logger = CLogger.getCLogger(WDocActionPanel.class);
    }
	
	public WDocActionPanel(GridTab mgridTab)
	{
		gridTab = mgridTab;
		DocStatus = (String)gridTab.getValue("DocStatus");
		DocAction = (String)gridTab.getValue("DocAction");
		if(DocAction.equals("--"))
			return;
		
		m_AD_Table_ID = Env.getContextAsInt(Env.getCtx(), gridTab.getWindowNo(), "BaseTable_ID");
		
		readReference();
		initComponents();
		dynInit();
		
		init();
		this.setAttribute("mode","modal");
		
		
	}
	
	/**
	 *	Dynamic Init - determine valid DocActions based on DocStatus for the different documents.
	 */
	private void dynInit()
	{
		
		//
		Object Processing = gridTab.getValue("Processing");
		String OrderType = Env.getContext(Env.getCtx(), gridTab.getWindowNo(), "OrderType");
		String IsSOTrx = Env.getContext(Env.getCtx(), gridTab.getWindowNo(), "IsSOTrx");

		if (DocStatus == null)
		{
			//message.setText("*** ERROR ***");
			return;
		}
		
		logger.fine("DocStatus=" + DocStatus 
			+ ", DocAction=" + DocAction + ", OrderType=" + OrderType 
			+ ", IsSOTrx=" + IsSOTrx + ", Processing=" + Processing 
			+ ", AD_Table_ID=" +gridTab.getAD_Table_ID() + ", Record_ID=" + gridTab.getRecord_ID());
        int index = 0;
        if(lstDocAction.getSelectedItem() != null)
        {
            String selected = (lstDocAction.getSelectedItem().getValue()).toString();
        
            for(int i = 0; i < s_value.length && index == 0; i++)       
            {
                if(s_value[i].equals(selected))
                {
                    index = i;
                }
            }
        }
        
		String[] options = new String[s_value.length];
		/**
		 * 	Check Existence of Workflow Acrivities
		 */
		String wfStatus = MWFActivity.getActiveInfo(Env.getCtx(), m_AD_Table_ID, gridTab.getRecord_ID()); 
		if (wfStatus != null)
		{
			FDialog.error(gridTab.getWindowNo(), this, "WFActiveForRecord", wfStatus);
			return;
		}
		
		//	Status Change
		if (!checkStatus(gridTab.getTableName(), gridTab.getRecord_ID(), DocStatus))
		{
			FDialog.error(gridTab.getWindowNo(), this, "DocumentStatusChanged");
			return;
		}
		/*******************
		 *  General Actions
		 */

		String[] docActionHolder = new String[]{DocAction};
		index = DocumentEngine.getValidActions(DocStatus, Processing, OrderType, IsSOTrx, 
				m_AD_Table_ID, docActionHolder, options);
		DocAction = docActionHolder[0];
		
		/**
		 *	Fill actionCombo
		 */
		
		for (int i = 0; i < index; i++)
		{
			//	Serach for option and add it
			boolean added = false;
		
			for (int j = 0; j < s_value.length && !added; j++)
			{
				if (options[i].equals(s_value[j]))
				{
					lstDocAction.appendItem(s_name[j],s_value[j]);
					added = true;
				}
			}
		}
		List<Listitem> lst = (List<Listitem>)lstDocAction.getItems();
		for(Listitem item: lst)
		{
			String value = item.getValue().toString();
			
			if(DocAction.equals(value))
			{
				lstDocAction.setSelectedItem(item);
				label.setValue(s_description[getSelectedIndex()]);
			}
		}
		//	setDefault
		if (DocAction.equals("--"))		//	If None, suggest closing
			DocAction = DocumentEngine.ACTION_Close;
	}
	
	private boolean checkStatus (String TableName, int Record_ID, String DocStatus)
	{
		String sql = "SELECT 2 FROM " + TableName 
			+ " WHERE " + TableName + "_ID=" + Record_ID
			+ " AND DocStatus='" + DocStatus + "'";
		int result = DB.getSQLValue(null, sql);
		return result == 2;
	}
	
	private void initComponents()
	{
		lblDocAction = new Label();
		lblDocAction.setId("lblDocAction");
		lblDocAction.setValue("Document Action");
				
		label = new Label();
		label.setId("label");
				
		lstDocAction  = new Listbox();
		lstDocAction.setId("lstDocAction");
		lstDocAction.setRows(0);
		lstDocAction.setMold("select");
		lstDocAction.setWidth("100px");
		lstDocAction.addEventListener(Events.ON_SELECT, this);
		
        confirmPanel = new ConfirmPanel(true);
        confirmPanel.addComponentsLeft(confirmPanel.createButton("Process"));
        confirmPanel.addActionListener(Events.ON_CLICK, this);
		
	}
	
	private void init()
	{
			
		Grid grid = new Grid();
        grid.setId("grd");
        grid.setWidth("400px");
		
        Rows rows = new Rows();
       
		Row rowDocAction = new Row();
		Row rowLabel = new Row();	
        Row rowConfirm = new Row();
		
		Panel pnlDocAction = new Panel();
		pnlDocAction.appendChild(lblDocAction);
		pnlDocAction.appendChild(lstDocAction);
		
		rowDocAction.appendChild(pnlDocAction);
		rowDocAction.setAlign("right");
		rowLabel.appendChild(label);
		rowConfirm.appendChild(confirmPanel);
	    rows.appendChild(rowDocAction);
	    rows.appendChild(rowLabel);
	    rows.appendChild(rowConfirm);
	    
	    grid.appendChild(rows);
	    this.setTitle("Document Action");
	    this.setWidth("410px");
	    this.setBorder("normal");
	    this.appendChild(grid);
	    
	}
	
	/**
	 *	Should the process be started?
	 *  @return OK pressed
	 */
	public boolean isStartProcess()
	{
		return m_OKpressed;
	}	//	isStartProcess

	public void onEvent(Event event)
	{
			
		if (Events.ON_CLICK.equals(event.getName()))
		{
			if (confirmPanel.getButton("Ok").equals(event.getTarget()))
			{
				m_OKpressed = true;
				setValue();
				this.detach();
			}
			else if (confirmPanel.getButton("Cancel").equals(event.getTarget()))
			{
				m_OKpressed = false;
				this.detach();
			}
			else if (confirmPanel.getButton("Process").equals(event.getTarget()))
			{
				
			}
		}
		else if (Events.ON_SELECT.equals(event.getName()))
		{
				
			if (lstDocAction.equals(event.getTarget()))
			{
				label.setValue(s_description[getSelectedIndex()]);
			}
		}
	}
		
	private void setValue()
	{
		int index = getSelectedIndex();
		//	Save Selection
		logger.config("DocAction=" + s_value[index]);
		gridTab.setValue("DocAction", s_value[index]);
	}	//	save

	 private void readReference()
	 {
	        ArrayList<String> v_value = new ArrayList<String>();
    		ArrayList<String> v_name = new ArrayList<String>();
    		ArrayList<String> v_description = new ArrayList<String>();
    	
    		DocumentEngine.readReferenceList(v_value, v_name, v_description);
	        
	    	int size = v_value.size();
			s_value = new String[size];
			s_name = new String[size];
			s_description = new String[size];
			
			for (int i = 0; i < size; i++)
			{
				s_value[i] = (String)v_value.get(i);
				s_name[i] = (String)v_name.get(i);
				s_description[i] = (String)v_description.get(i);
			}
	 }   //  readReference
     
	 public int getSelectedIndex()
	 {
		int index = 0;
		if(lstDocAction.getSelectedItem() != null)
		{
			String selected = (lstDocAction.getSelectedItem().getValue()).toString();
		
			for(int i = 0; i < s_value.length && index == 0; i++)		
			{
				if(s_value[i].equals(selected))
				{
					index = i;
                    break;
				}
			}
		}
		return index;
	}	//	getSelectedIndex

	public boolean isAsap()
	{
		return true;
	}
	
}
