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

package org.adempiere.webui.component;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;

import org.adempiere.webui.LayoutUtils;
import org.adempiere.webui.event.ToolbarListener;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zk.ui.event.KeyEvent;
import org.zkoss.zul.Label;

/**
 *
 * @author  <a href="mailto:agramdass@gmail.com">Ashley G Ramdass</a>
 * @date    Feb 25, 2007
 * @version $Revision: 0.10 $
 * 
 * @author Cristina Ghita, www.arhipac.ro
 * 				<li>FR [ 2076330 ] Add new methods in CWindowToolbar class
 */
public class CWindowToolbar extends FToolbar implements EventListener
{
    private static final long serialVersionUID = 1L;
    
    private static final String BUTTON_WIDTH = "32px";
    
    private static CLogger log = CLogger.getCLogger(CWindowToolbar.class);

    private ToolBarButton btnIgnore;

    private ToolBarButton btnHelp, btnNew, btnCopy, btnDelete, btnSave;

    private ToolBarButton btnRefresh, btnFind, btnAttachment;
    
    private ToolBarButton btnGridToggle;

    private ToolBarButton btnHistoryRecords, btnParentRecord, btnDetailRecord;

    private ToolBarButton btnFirst, btnPrevious, btnNext, btnLast;

    private ToolBarButton btnReport, btnArchive, btnPrint;

    private ToolBarButton btnZoomAcross, btnActiveWorkflows, btnRequests, btnProductInfo;
    
    private HashMap<String, ToolBarButton> buttons = new HashMap<String, ToolBarButton>();

//    private ToolBarButton btnExit;
    
    private ArrayList<ToolbarListener> listeners = new ArrayList<ToolbarListener>();
        
    private Event event;
    
    private Map<Integer, ToolBarButton> keyMap = new HashMap<Integer, ToolBarButton>();

    public CWindowToolbar()
    {
        init();
    }

    private void init()
    {
    	LayoutUtils.addSclass("adwindow-toolbar", this);

        btnIgnore = createButton("Ignore", "Ignore16.png", "Ignore");
        addSeparator();
        btnHelp = createButton("Help", "Help24.png","Help");
        btnNew = createButton("New", "New24.png", "New");
        btnCopy = createButton("Copy", "Copy24.png", "Copy");
        btnDelete = createButton("Delete", "Delete24.png", "Delete");
        btnSave = createButton("Save", "Save24.png", "Save");
        addSeparator();
        btnRefresh = createButton("Refresh", "Refresh24.png", "Refresh");
        btnFind = createButton("Find", "Find24.png", "Find");
        btnAttachment = createButton("Attachment", "Attachment24.png", "Attachment");
        btnGridToggle = createButton("Toggle", "Multi24.png", "Multi");
        addSeparator();
        btnHistoryRecords = createButton("HistoryRecords", "HistoryX24.png", "History");
        btnParentRecord = createButton("ParentRecord", "Parent24.png", "Parent");
        btnDetailRecord = createButton("DetailRecord", "Detail24.png", "Detail");
        addSeparator();
        btnFirst = createButton("First", "First24.png", "First");
        btnPrevious = createButton("Previous", "Previous24.png", "Previous");
        btnNext = createButton("Next", "Next24.png", "Next");
        btnLast = createButton("Last", "Last24.png", "Last");
        addSeparator();
        btnReport = createButton("Report", "Report24.png", "Report");
        btnArchive = createButton("Archive", "Archive24.png", "Archive");
        btnPrint = createButton("Print", "Print24.png", "Print");
        addSeparator();
        btnZoomAcross = createButton("ZoomAcross", "ZoomAcross24.png", "ZoomAcross");
        btnActiveWorkflows = createButton("ActiveWorkflows", "WorkFlow24.png", "WorkFlow");
        btnRequests = createButton("Requests", "Request24.png", "Request");
        btnProductInfo = createButton("ProductInfo", "Product24.png", "InfoProduct");
        
        for (Object obj : this.getChildren())
        {
            if (obj instanceof ToolBarButton)
            {
                ((ToolBarButton)obj).setWidth(BUTTON_WIDTH);
                ((ToolBarButton)obj).addEventListener(Events.ON_CLICK, this);
                ((ToolBarButton)obj).setDisabled(true);
            }
        }
        
        // Help and Exit should always be enabled
        btnHelp.setDisabled(false);
//        btnExit.setDisabled(false);
        
        // Testing Purposes
        
        btnGridToggle.setDisabled(false);
        
        btnZoomAcross.setDisabled(false);
                
        btnActiveWorkflows.setDisabled(false); // Elaine 2008/07/17
        btnRequests.setDisabled(false); // Elaine 2008/07/22
        btnProductInfo.setDisabled(false); // Elaine 2008/07/22
        btnArchive.setDisabled(false); // Elaine 2008/07/28
        
        configureKeyMap();
    }
    
    private ToolBarButton createButton(String name, String image, String tooltip)
    {
    	ToolBarButton btn = new ToolBarButton("");
        btn.setName("btn"+name);
        btn.setImage("/images/"+image);
        btn.setTooltiptext(Msg.getMsg(Env.getCtx(),tooltip));
        buttons.put(name, btn);
        this.appendChild(btn);
        return btn;
    }

    private void configureKeyMap() {
		keyMap.put(KeyEvent.F1, btnHelp);		
		keyMap.put(KeyEvent.F2, btnNew);
		keyMap.put(KeyEvent.F3, btnDelete);
		keyMap.put(KeyEvent.F4, btnSave);
		keyMap.put(KeyEvent.F5, btnRefresh);
		keyMap.put(KeyEvent.F6, btnFind);
		keyMap.put(KeyEvent.F7, btnAttachment);
		keyMap.put(KeyEvent.F8, btnGridToggle);
		keyMap.put(KeyEvent.F9, btnHistoryRecords);
		keyMap.put(KeyEvent.F11, btnReport);
		keyMap.put(KeyEvent.F12, btnPrint);
	}

	protected void addSeparator()
    {
        Label lblSeparator = new Label();
        lblSeparator.setWidth("3px");
        lblSeparator.setHeight("16px");
        lblSeparator.setValue(" ");
        this.appendChild(lblSeparator);
    }

    public void addListener(ToolbarListener toolbarListener)
    {
        listeners.add(toolbarListener);
    }

    public void removeListener(ToolbarListener toolbarListener)
    {
        listeners.remove(toolbarListener);
    }

    public void onEvent(Event event)
    {    	
        String eventName = event.getName();
        Component eventComp = event.getTarget();
        
        if(eventName.equals(Events.ON_CLICK))
        {
            if(event.getTarget() instanceof ToolBarButton)
            {
            	doOnClick(event);
            }
        } else if (eventName.equals(Events.ON_CTRL_KEY)) 
        {
        	KeyEvent keyEvent = (KeyEvent) event;
        	this.onCtrlKeyEvent(keyEvent.getKeyCode());
        }
    }

	private void doOnClick(Event event) {
		this.event = event;
		ToolBarButton cComponent = (ToolBarButton) event.getTarget();
		String compName = cComponent.getName();
		String methodName = "on" + compName.substring(3);
		Iterator<ToolbarListener> listenerIter = listeners.iterator();
		while(listenerIter.hasNext())
		{
		    try
		    {
		        ToolbarListener tListener = listenerIter.next();
		        Method method = tListener.getClass().getMethod(methodName, (Class[]) null);
		        method.invoke(tListener, (Object[]) null);
		    }
		    catch(SecurityException e)
		    {
		        log.log(Level.SEVERE, "Could not invoke Toolbar listener method: " + methodName + "()", e);
		    }
		    catch(NoSuchMethodException e)
		    {
		        log.log(Level.SEVERE, "Could not invoke Toolbar listener method: " + methodName + "()", e);
		    }
		    catch(IllegalArgumentException e)
		    {
		        log.log(Level.SEVERE, "Could not invoke Toolbar listener method: " + methodName + "()", e);
		    }
		    catch(IllegalAccessException e)
		    {
		        log.log(Level.SEVERE, "Could not invoke Toolbar listener method: " + methodName + "()", e);
		    }
		    catch(InvocationTargetException e)
		    {
		        log.log(Level.SEVERE, "Could not invoke Toolbar listener method: " + methodName + "()", e);
		    }
		}
		this.event = null;
	}
    
    public void enableHistoryRecords(boolean enabled)
    {
    	this.btnHistoryRecords.setDisabled(!enabled);
    }
    
    public void enableNavigation(boolean enabled)
    {
        this.btnFirst.setDisabled(!enabled);
        this.btnPrevious.setDisabled(!enabled);
        this.btnNext.setDisabled(!enabled);
        this.btnLast.setDisabled(!enabled);
    }
    
    public void enableTabNavigation(boolean enabled)
    {
        enableTabNavigation(enabled, enabled);
    }
    
    public void enableTabNavigation(boolean enableParent, boolean enableDetail)
    {
        this.btnParentRecord.setDisabled(!enableParent);
        this.btnDetailRecord.setDisabled(!enableDetail);
    }
    
    public void enableFirstNavigation(boolean enabled)
    {
        this.btnFirst.setDisabled(!enabled);
        this.btnPrevious.setDisabled(!enabled);
    }
    
    public void enableLastNavigation(boolean enabled)
    {
        this.btnLast.setDisabled(!enabled);
        this.btnNext.setDisabled(!enabled);
    }
    
    public void enabledNew(boolean enabled)
    {
        this.btnNew.setDisabled(!enabled);
    }
    
   /* public void enableEdit(boolean enabled)
    {
        this.btnEdit.setEnabled(enabled);
    }*/
    
    public void enableRefresh(boolean enabled)
    {
        this.btnRefresh.setDisabled(!enabled);
    }
    
    public void enableSave(boolean enabled)
    {
        this.btnSave.setDisabled(!enabled);
    }
    
    public boolean isSaveEnable() {
    	return !btnSave.isDisabled();
    }
    
//    public void enableExit(boolean enabled)
//    {
//    	this.btnExit.setDisabled(!enabled);
//    }
    
    public void enableDelete(boolean enabled)
    {
        this.btnDelete.setDisabled(!enabled);
    }
    
    public void enableDeleteSelection(boolean enabled)
    {
        // TODO add delete selection button
    }
    
    public void enableChanges(boolean enabled)
    {
        this.btnNew.setDisabled(!enabled);
        this.btnCopy.setDisabled(!enabled);
    }
    
    public void enableIgnore(boolean enabled)
    {
        this.btnIgnore.setDisabled(!enabled);
    }
    
    public void enableNew(boolean enabled)
    {
        this.btnNew.setDisabled(!enabled);
    }
    
    public void enableAttachment(boolean enabled)
    {
        this.btnAttachment.setDisabled(!enabled);
    }
    
    public void enablePrint(boolean enabled)
    {
    	this.btnPrint.setDisabled(!enabled);
    }
    
    public void enableReport(boolean enabled)
    {
    	this.btnReport.setDisabled(!enabled);
    }
    
    public void enableCopy(boolean enabled)
    {
    	this.btnCopy.setDisabled(!enabled);
    }
    
    public void enableFind(boolean enabled)
    {
        this.btnFind.setDisabled(!enabled);
        
    }
    
    public void enableGridToggle(boolean enabled)
    {
    	btnGridToggle.setDisabled(!enabled);
    }
    
    public Event getEvent() 
    {
    	return event;
    }

	public void onCtrlKeyEvent(int keycode) {
		if (isRealVisible()) {
			ToolBarButton btn = keyMap.get(keycode);
			if (btn != null && !btn.isDisabled() && btn.isVisible()) {
				Events.sendEvent(btn, new Event(Events.ON_CLICK, btn));
			}
		}
		
	}

	private boolean isRealVisible() {
		if (!isVisible())
			return false;
		Component parent = this.getParent();
		while (parent != null) {
			if (!parent.isVisible())
				return false;
			parent = parent.getParent();
		}
		return true;
	}
	
	public void setVisibleAll(boolean visible)
	{
		for (ToolBarButton btn : buttons.values())
		{
			btn.setVisible(visible);
		}
	}
	
	public void setVisible(String buttonName, boolean visible)
	{
		ToolBarButton btn = buttons.get(buttonName);
		if (btn != null)
		{
			btn.setVisible(visible);
		}
	}
	
}
