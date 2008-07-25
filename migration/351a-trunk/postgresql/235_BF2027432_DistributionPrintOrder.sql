-- Jul 24, 2008 3:36:06 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,AD_Val_Rule_ID,ColumnName,Created,CreatedBy,DefaultValue,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56188,113,0,19,53038,130,'AD_Org_ID',TO_TIMESTAMP('2007-12-17 07:21:37','YYYY-MM-DD HH24:MI:SS'),0,'@AD_Org_ID@','Organizational entity within client','EE01',22,'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','Y','N','N','N','N','Y','N','N','Y','N','N','Organization',TO_TIMESTAMP('2007-12-17 07:21:37','YYYY-MM-DD HH24:MI:SS'),0,1)
;

-- Jul 24, 2008 3:37:40 PM CDT
-- Order Distribution
UPDATE AD_Tab SET AD_Column_ID=53930,Updated=TO_TIMESTAMP('2008-07-24 15:37:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=53050
;

-- Jul 24, 2008 3:38:15 PM CDT
-- Order Distribution
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=54027
;

-- Jul 24, 2008 3:38:15 PM CDT
-- Order Distribution
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=54036
;

-- Jul 24, 2008 3:38:15 PM CDT
-- Order Distribution
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=54037
;

-- Jul 24, 2008 3:38:15 PM CDT
-- Order Distribution
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=54038
;

-- Jul 24, 2008 3:38:15 PM CDT
-- Order Distribution
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=54039
;

-- Jul 24, 2008 3:38:52 PM CDT
-- Order Distribution
UPDATE AD_Field SET IsCentrallyMaintained='N', Name='Ordered Quantity',Updated=TO_TIMESTAMP('2008-07-24 15:38:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=54035
;

-- Jul 24, 2008 3:38:52 PM CDT
-- Order Distribution
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=54035
;

-- Jul 24, 2008 3:38:59 PM CDT
-- Order Distribution
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2008-07-24 15:38:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=54027
;

-- Jul 24, 2008 8:22:25 PM CDT
-- Order Distribution
UPDATE AD_Column SET DefaultValue='@DatePromised@',Updated=TO_TIMESTAMP('2008-07-24 20:22:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=53940
;

-- Jul 24, 2008 8:23:04 PM CDT
-- Order Distribution
UPDATE AD_Column SET DefaultValue='@DateOrdered@',Updated=TO_TIMESTAMP('2008-07-24 20:23:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=53939
;

-- Jul 24, 2008 8:36:04 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=31, AD_Reference_Value_ID=NULL,Updated=TO_TIMESTAMP('2008-07-24 20:36:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=53950
;

-- Jul 24, 2008 8:37:40 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=31, AD_Reference_Value_ID=NULL, DefaultValue='@M_LocatorTo_ID@',Updated=TO_TIMESTAMP('2008-07-24 20:37:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=53949
;

-- Jul 24, 2008 8:38:22 PM CDT
-- Order Distribution
UPDATE AD_Column SET DefaultValue='@M_Locator_ID@',Updated=TO_TIMESTAMP('2008-07-24 20:38:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=53950
;

-- Jul 24, 2008 8:41:33 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=19,Updated=TO_TIMESTAMP('2008-07-24 20:41:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=53950
;

-- Jul 24, 2008 8:41:56 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=18, AD_Reference_Value_ID=191,Updated=TO_TIMESTAMP('2008-07-24 20:41:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=53949
;

-- Jul 24, 2008 8:43:39 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Val_Rule_ID=NULL,Updated=TO_TIMESTAMP('2008-07-24 20:43:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=53950
;

-- Jul 24, 2008 8:54:15 PM CDT
-- Order Distribution
UPDATE AD_Val_Rule SET Code='M_Warehouse.IsInTransit=''Y''',Updated=TO_TIMESTAMP('2008-07-24 20:54:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Val_Rule_ID=52024
;

-- Jul 24, 2008 9:37:10 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56190,102,0,19,53039,'AD_Client_ID',TO_TIMESTAMP('2008-07-24 21:37:08','YYYY-MM-DD HH24:MI:SS'),0,'Client/Tenant for this installation.','EE01',10,'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','Y','N','N','N','N','N','N','N','N','N','Client',TO_TIMESTAMP('2008-07-24 21:37:08','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:10 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56190 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:11 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56191,113,0,19,53039,'AD_Org_ID',TO_TIMESTAMP('2008-07-24 21:37:10','YYYY-MM-DD HH24:MI:SS'),0,'Organizational entity within client','EE01',10,'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','Y','N','N','N','N','N','N','N','N','N','Organization',TO_TIMESTAMP('2008-07-24 21:37:10','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:11 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56191 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:12 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56192,348,0,20,53039,'IsActive',TO_TIMESTAMP('2008-07-24 21:37:11','YYYY-MM-DD HH24:MI:SS'),0,'The record is active in the system','EE01',1,'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','Y','N','N','N','N','N','N','N','N','Y','Active',TO_TIMESTAMP('2008-07-24 21:37:11','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:12 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56192 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:13 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56193,245,0,16,53039,'Created',TO_TIMESTAMP('2008-07-24 21:37:12','YYYY-MM-DD HH24:MI:SS'),0,'Date this record was created','EE01',29,'The Created field indicates the date that this record was created.','Y','N','N','N','N','N','N','N','N','N','Created',TO_TIMESTAMP('2008-07-24 21:37:12','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:13 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56193 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:14 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56194,246,0,18,110,53039,'CreatedBy',TO_TIMESTAMP('2008-07-24 21:37:13','YYYY-MM-DD HH24:MI:SS'),0,'User who created this records','EE01',10,'The Created By field indicates the user who created this record.','Y','N','N','N','N','N','N','N','N','N','Created By',TO_TIMESTAMP('2008-07-24 21:37:13','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:14 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56194 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:14 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56195,607,0,16,53039,'Updated',TO_TIMESTAMP('2008-07-24 21:37:14','YYYY-MM-DD HH24:MI:SS'),0,'Date this record was updated','EE01',29,'The Updated field indicates the date that this record was updated.','Y','N','N','N','N','N','N','N','N','N','Updated',TO_TIMESTAMP('2008-07-24 21:37:14','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:14 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56195 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:15 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56196,608,0,18,110,53039,'UpdatedBy',TO_TIMESTAMP('2008-07-24 21:37:14','YYYY-MM-DD HH24:MI:SS'),0,'User who updated this records','EE01',10,'The Updated By field indicates the user who updated this record.','Y','N','N','N','N','N','N','N','N','N','Updated By',TO_TIMESTAMP('2008-07-24 21:37:14','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:15 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56196 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:16 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56197,109,0,14,53039,'AD_Language',TO_TIMESTAMP('2008-07-24 21:37:15','YYYY-MM-DD HH24:MI:SS'),0,'Language for this entity','EE01',2147483647,'The Language identifies the language to use for display and formatting','Y','N','N','N','N','N','N','N','N','Y','Language',TO_TIMESTAMP('2008-07-24 21:37:15','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:16 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56197 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:16 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56198,558,0,19,53039,'C_Order_ID',TO_TIMESTAMP('2008-07-24 21:37:16','YYYY-MM-DD HH24:MI:SS'),0,'Order','EE01',10,'The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you cloase an order, unshipped (backordered) quantities are cancelled.','Y','N','N','N','N','N','N','N','N','Y','Order',TO_TIMESTAMP('2008-07-24 21:37:16','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:16 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56198 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:17 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56199,1106,0,20,53039,'IsSOTrx',TO_TIMESTAMP('2008-07-24 21:37:16','YYYY-MM-DD HH24:MI:SS'),0,'This is a Sales Transaction','EE01',1,'The Sales Transaction checkbox indicates if this item is a Sales Transaction.','Y','N','N','N','N','N','N','N','N','Y','Sales Transaction',TO_TIMESTAMP('2008-07-24 21:37:16','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:17 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56199 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:19 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56200,290,0,10,53039,'DocumentNo',TO_TIMESTAMP('2008-07-24 21:37:17','YYYY-MM-DD HH24:MI:SS'),0,'Document sequence number of the document','EE01',30,'The document number is usually automatically generated by the system and determined by the document type of the document. If the document is not saved, the preliminary number is displayed in "<>".

If the document type of your document has no automatic document sequence defined, the field is empty if you create a new document. This is for documents which usually have an external number (like vendor invoice).  If you leave the field empty, the system will generate a document number for you. The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','Y','N','N','N','N','N','N','N','N','Y','Document No',TO_TIMESTAMP('2008-07-24 21:37:17','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:19 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56200 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:19 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56201,289,0,17,53039,'DocStatus',TO_TIMESTAMP('2008-07-24 21:37:19','YYYY-MM-DD HH24:MI:SS'),0,'The current status of the document','EE01',2,'The Document Status indicates the status of a document at this time.  If you want to change the document status, use the Document Action field','Y','N','N','N','N','N','N','N','N','Y','Document Status',TO_TIMESTAMP('2008-07-24 21:37:19','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:19 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56201 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:20 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56202,196,0,19,53039,'C_DocType_ID',TO_TIMESTAMP('2008-07-24 21:37:19','YYYY-MM-DD HH24:MI:SS'),0,'Document type or rules','EE01',10,'The Document Type determines document sequence and processing rules','Y','N','N','N','N','N','N','N','N','Y','Document Type',TO_TIMESTAMP('2008-07-24 21:37:19','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:20 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56202 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:21 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56203,187,0,19,53039,'C_BPartner_ID',TO_TIMESTAMP('2008-07-24 21:37:20','YYYY-MM-DD HH24:MI:SS'),0,'Identifies a Business Partner','EE01',10,'A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson','Y','N','N','N','N','N','N','N','N','Y','Business Partner ',TO_TIMESTAMP('2008-07-24 21:37:20','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:21 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56203 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:21 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56204,1876,0,10,53039,'BPValue',TO_TIMESTAMP('2008-07-24 21:37:21','YYYY-MM-DD HH24:MI:SS'),0,'Business Partner Key Value','EE01',40,'Search Key of Business Partner','Y','N','N','N','N','N','N','N','N','Y','BP Search Key',TO_TIMESTAMP('2008-07-24 21:37:21','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:22 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56204 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:22 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56205,2266,0,10,53039,'BPTaxID',TO_TIMESTAMP('2008-07-24 21:37:22','YYYY-MM-DD HH24:MI:SS'),0,'Tax ID of the Business Partner','EE01',20,'Y','N','N','N','N','N','N','N','N','Y','Partner Tax ID',TO_TIMESTAMP('2008-07-24 21:37:22','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:22 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56205 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:23 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56206,468,0,10,53039,'NAICS',TO_TIMESTAMP('2008-07-24 21:37:22','YYYY-MM-DD HH24:MI:SS'),0,'Standard Industry Code or its successor NAIC - http://www.osha.gov/oshstats/sicser.html','EE01',6,'The NAICS/SIC identifies either of these codes that may be applicable to this Business Partner.','Y','N','N','N','N','N','N','N','N','Y','NAICS/SIC',TO_TIMESTAMP('2008-07-24 21:37:22','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:23 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56206 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:24 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56207,260,0,10,53039,'DUNS',TO_TIMESTAMP('2008-07-24 21:37:23','YYYY-MM-DD HH24:MI:SS'),0,'Dun & Bradstreet Number','EE01',11,'Used for EDI - For details see   www.dnb.com/dunsno/list.htm','Y','N','N','N','N','N','N','N','N','Y','D-U-N-S',TO_TIMESTAMP('2008-07-24 21:37:23','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:24 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56207 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:25 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56208,1874,0,19,53039,'Org_Location_ID',TO_TIMESTAMP('2008-07-24 21:37:24','YYYY-MM-DD HH24:MI:SS'),0,'Organization Location/Address','EE01',10,'Y','N','N','N','N','N','N','N','N','Y','Org Address',TO_TIMESTAMP('2008-07-24 21:37:24','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:25 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56208 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:26 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56209,590,0,10,53039,'TaxID',TO_TIMESTAMP('2008-07-24 21:37:25','YYYY-MM-DD HH24:MI:SS'),0,'Tax Identification','EE01',20,'The Tax ID field identifies the legal Identification number of this Entity.','Y','N','N','N','N','N','N','N','N','Y','Tax ID',TO_TIMESTAMP('2008-07-24 21:37:25','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:26 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56209 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:26 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56210,459,0,19,53039,'M_Warehouse_ID',TO_TIMESTAMP('2008-07-24 21:37:26','YYYY-MM-DD HH24:MI:SS'),0,'Storage Warehouse and Service Point','EE01',10,'The Warehouse identifies a unique Warehouse where products are stored or Services are provided.','Y','N','N','N','N','N','N','N','N','Y','Warehouse',TO_TIMESTAMP('2008-07-24 21:37:26','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:26 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56210 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:27 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56211,1875,0,19,53039,'Warehouse_Location_ID',TO_TIMESTAMP('2008-07-24 21:37:26','YYYY-MM-DD HH24:MI:SS'),0,'Warehouse Location/Address','EE01',10,'Address of Warehouse','Y','N','N','N','N','N','N','N','N','Y','Warehouse Address',TO_TIMESTAMP('2008-07-24 21:37:26','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:27 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56211 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:28 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56212,1841,0,10,53039,'DocumentType',TO_TIMESTAMP('2008-07-24 21:37:27','YYYY-MM-DD HH24:MI:SS'),0,'Document Type','EE01',60,'Y','N','N','N','N','N','N','N','N','Y','Document Type',TO_TIMESTAMP('2008-07-24 21:37:27','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:28 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56212 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:29 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56213,1842,0,14,53039,'DocumentTypeNote',TO_TIMESTAMP('2008-07-24 21:37:28','YYYY-MM-DD HH24:MI:SS'),0,'Optional note of a document type','EE01',2000,'Y','N','N','N','N','N','N','N','N','Y','Document Type Note',TO_TIMESTAMP('2008-07-24 21:37:28','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:29 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56213 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:30 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56214,1063,0,18,190,53039,'SalesRep_ID',TO_TIMESTAMP('2008-07-24 21:37:29','YYYY-MM-DD HH24:MI:SS'),0,'Sales Representative or Company Agent','EE01',10,'The Sales Representative indicates the Sales Rep for this Region.  Any Sales Rep must be a valid internal user.','Y','N','N','N','N','N','N','N','N','Y','Sales Representative',TO_TIMESTAMP('2008-07-24 21:37:29','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:30 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56214 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:31 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56215,1886,0,10,53039,'SalesRep_Name',TO_TIMESTAMP('2008-07-24 21:37:30','YYYY-MM-DD HH24:MI:SS'),0,'EE01',60,'Y','N','N','N','N','N','N','N','N','Y','Sales Representative',TO_TIMESTAMP('2008-07-24 21:37:30','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:31 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56215 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:31 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56216,268,0,16,53039,'DateOrdered',TO_TIMESTAMP('2008-07-24 21:37:31','YYYY-MM-DD HH24:MI:SS'),0,'Date of Order','EE01',29,'Indicates the Date an item was ordered.','Y','N','N','N','N','N','N','N','N','Y','Date Ordered',TO_TIMESTAMP('2008-07-24 21:37:31','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:31 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56216 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:32 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56217,269,0,16,53039,'DatePromised',TO_TIMESTAMP('2008-07-24 21:37:31','YYYY-MM-DD HH24:MI:SS'),0,'Date Order was promised','EE01',29,'The Date Promised indicates the date, if any, that an Order was promised for.','Y','N','N','N','N','N','N','N','N','Y','Date Promised',TO_TIMESTAMP('2008-07-24 21:37:31','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:32 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56217 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:34 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56218,1838,0,10,53039,'BPGreeting',TO_TIMESTAMP('2008-07-24 21:37:32','YYYY-MM-DD HH24:MI:SS'),0,'Greeting for Business Partner','EE01',60,'Y','N','N','N','N','N','N','N','N','Y','BP Greeting',TO_TIMESTAMP('2008-07-24 21:37:32','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:34 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56218 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:35 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,56219,469,0,10,53039,'Name',TO_TIMESTAMP('2008-07-24 21:37:34','YYYY-MM-DD HH24:MI:SS'),0,'Alphanumeric identifier of the entity','EE01',60,'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','Y','N','N','Y','N','N','N','N','N','Y','Name',1,TO_TIMESTAMP('2008-07-24 21:37:34','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:35 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56219 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:36 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56220,1111,0,10,53039,'Name2',TO_TIMESTAMP('2008-07-24 21:37:35','YYYY-MM-DD HH24:MI:SS'),0,'Additional Name','EE01',60,'Y','N','N','N','N','N','N','N','N','Y','Name 2',TO_TIMESTAMP('2008-07-24 21:37:35','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:36 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56220 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:36 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56221,1837,0,10,53039,'BPContactGreeting',TO_TIMESTAMP('2008-07-24 21:37:36','YYYY-MM-DD HH24:MI:SS'),0,'Greeting for Business Partner Contact','EE01',60,'Y','N','N','N','N','N','N','N','N','Y','BP Contact Greeting',TO_TIMESTAMP('2008-07-24 21:37:36','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:37 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56221 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:37 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56222,982,0,10,53039,'Title',TO_TIMESTAMP('2008-07-24 21:37:37','YYYY-MM-DD HH24:MI:SS'),0,'Name this entity is referred to as','EE01',40,'The Title indicates the name that an entity is referred to as.','Y','N','N','N','N','N','N','N','N','Y','Title',TO_TIMESTAMP('2008-07-24 21:37:37','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:37 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56222 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:38 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56223,505,0,10,53039,'Phone',TO_TIMESTAMP('2008-07-24 21:37:37','YYYY-MM-DD HH24:MI:SS'),0,'Identifies a telephone number','EE01',40,'The Phone field identifies a telephone number','Y','N','N','N','N','N','N','N','N','Y','Phone',TO_TIMESTAMP('2008-07-24 21:37:37','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:38 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56223 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:40 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56224,1839,0,14,53039,'ContactName',TO_TIMESTAMP('2008-07-24 21:37:38','YYYY-MM-DD HH24:MI:SS'),0,'Business Partner Contact Name','EE01',2147483647,'Y','N','N','N','N','N','N','N','N','Y','Contact Name',TO_TIMESTAMP('2008-07-24 21:37:38','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:40 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56224 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:40 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56225,202,0,21,53039,'C_Location_ID',TO_TIMESTAMP('2008-07-24 21:37:40','YYYY-MM-DD HH24:MI:SS'),0,'Location or Address','EE01',10,'The Location / Address field defines the location of an entity.','Y','N','N','N','N','N','N','N','N','Y','Address',TO_TIMESTAMP('2008-07-24 21:37:40','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:40 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56225 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:41 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56226,512,0,14,53039,'Postal',TO_TIMESTAMP('2008-07-24 21:37:40','YYYY-MM-DD HH24:MI:SS'),0,'Postal code','EE01',2147483647,'The Postal Code or ZIP identifies the postal code for this entity''s address.','Y','N','N','N','N','N','N','N','N','Y','ZIP',TO_TIMESTAMP('2008-07-24 21:37:40','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:41 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56226 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:42 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56227,540,0,10,53039,'ReferenceNo',TO_TIMESTAMP('2008-07-24 21:37:41','YYYY-MM-DD HH24:MI:SS'),0,'Your customer or vendor number at the Business Partner''s site','EE01',40,'The reference number can be printed on orders and invoices to allow your business partner to faster identify your records.','Y','N','N','N','N','N','N','N','N','Y','Reference No',TO_TIMESTAMP('2008-07-24 21:37:41','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:42 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56227 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:42 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56228,275,0,10,53039,'Description',TO_TIMESTAMP('2008-07-24 21:37:42','YYYY-MM-DD HH24:MI:SS'),0,'Optional short description of the record','EE01',255,'A description is limited to 255 characters.','Y','N','N','N','N','N','N','N','N','Y','Description',TO_TIMESTAMP('2008-07-24 21:37:42','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:43 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56228 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:43 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56229,952,0,10,53039,'POReference',TO_TIMESTAMP('2008-07-24 21:37:43','YYYY-MM-DD HH24:MI:SS'),0,'Transaction Reference Number (Sales Order, Purchase Order) of your Business Partner','EE01',20,'The business partner order reference is the order reference for this specific transaction; Often Purchase Order numbers are given to print on Invoices for easier reference.  A standard number can be defined in the Business Partner (Customer) window.','Y','N','N','N','N','N','N','N','N','Y','Order Reference',TO_TIMESTAMP('2008-07-24 21:37:43','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:43 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56229 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:44 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56230,968,0,19,53039,'C_Charge_ID',TO_TIMESTAMP('2008-07-24 21:37:43','YYYY-MM-DD HH24:MI:SS'),0,'Additional document charges','EE01',10,'The Charge indicates a type of Charge (Handling, Shipping, Restocking)','Y','N','N','N','N','N','N','N','N','Y','Charge',TO_TIMESTAMP('2008-07-24 21:37:43','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:44 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56230 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:45 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56231,849,0,12,53039,'ChargeAmt',TO_TIMESTAMP('2008-07-24 21:37:44','YYYY-MM-DD HH24:MI:SS'),0,'Charge Amount','EE01',131089,'The Charge Amount indicates the amount for an additional charge.','Y','N','N','N','N','N','N','N','N','Y','Charge amount',TO_TIMESTAMP('2008-07-24 21:37:44','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:45 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56231 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:46 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56232,627,0,22,53039,'Volume',TO_TIMESTAMP('2008-07-24 21:37:45','YYYY-MM-DD HH24:MI:SS'),0,'Volume of a product','EE01',131089,'The Volume indicates the volume of the product in the Volume UOM of the Client','Y','N','N','N','N','N','N','N','N','Y','Volume',TO_TIMESTAMP('2008-07-24 21:37:45','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:46 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56232 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:47 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56233,629,0,22,53039,'Weight',TO_TIMESTAMP('2008-07-24 21:37:46','YYYY-MM-DD HH24:MI:SS'),0,'Weight of a product','EE01',131089,'The Weight indicates the weight  of the product in the Weight UOM of the Client','Y','N','N','N','N','N','N','N','N','Y','Weight',TO_TIMESTAMP('2008-07-24 21:37:46','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:47 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56233 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:49 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56234,550,0,19,53039,'C_Campaign_ID',TO_TIMESTAMP('2008-07-24 21:37:47','YYYY-MM-DD HH24:MI:SS'),0,'Marketing Campaign','EE01',10,'The Campaign defines a unique marketing program.  Projects can be associated with a pre defined Marketing Campaign.  You can then report based on a specific Campaign.','Y','N','N','N','N','N','N','N','N','Y','Campaign',TO_TIMESTAMP('2008-07-24 21:37:47','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:49 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56234 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:49 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56235,208,0,19,53039,'C_Project_ID',TO_TIMESTAMP('2008-07-24 21:37:49','YYYY-MM-DD HH24:MI:SS'),0,'Financial Project','EE01',10,'A Project allows you to track and control internal or external activities.','Y','N','N','N','N','N','N','N','N','Y','Project',TO_TIMESTAMP('2008-07-24 21:37:49','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:50 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56235 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:50 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56236,1005,0,19,53039,'C_Activity_ID',TO_TIMESTAMP('2008-07-24 21:37:50','YYYY-MM-DD HH24:MI:SS'),0,'Business Activity','EE01',10,'Activities indicate tasks that are performed and used to utilize Activity based Costing','Y','N','N','N','N','N','N','N','N','Y','Activity',TO_TIMESTAMP('2008-07-24 21:37:50','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:50 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56236 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:51 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56237,455,0,19,53039,'M_Shipper_ID',TO_TIMESTAMP('2008-07-24 21:37:50','YYYY-MM-DD HH24:MI:SS'),0,'Method or manner of product delivery','EE01',10,'The Shipper indicates the method of delivering product','Y','N','N','N','N','N','N','N','N','Y','Shipper',TO_TIMESTAMP('2008-07-24 21:37:50','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:51 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56237 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:53 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56238,555,0,20,53039,'DeliveryRule',TO_TIMESTAMP('2008-07-24 21:37:51','YYYY-MM-DD HH24:MI:SS'),0,'Defines the timing of Delivery','EE01',1,'The Delivery Rule indicates when an order should be delivered. For example should the order be delivered when the entire order is complete, when a line is complete or as the products become available.','Y','N','N','N','N','N','N','N','N','Y','Delivery Rule',TO_TIMESTAMP('2008-07-24 21:37:51','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:53 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56238 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:54 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56239,274,0,20,53039,'DeliveryViaRule',TO_TIMESTAMP('2008-07-24 21:37:53','YYYY-MM-DD HH24:MI:SS'),0,'How the order will be delivered','EE01',1,'The Delivery Via indicates how the products should be delivered. For example, will the order be picked up or shipped.','Y','N','N','N','N','N','N','N','N','Y','Delivery Via',TO_TIMESTAMP('2008-07-24 21:37:53','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:54 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56239 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:37:55 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56240,522,0,20,53039,'PriorityRule',TO_TIMESTAMP('2008-07-24 21:37:54','YYYY-MM-DD HH24:MI:SS'),0,'Priority of a document','EE01',1,'The Priority indicates the importance (high, medium, low) of this document','Y','N','N','N','N','N','N','N','N','Y','Priority',TO_TIMESTAMP('2008-07-24 21:37:54','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:37:55 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56240 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:38:08 PM CDT
-- Order Distribution
UPDATE AD_Table SET IsView='Y',Updated=TO_TIMESTAMP('2008-07-24 21:38:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Table_ID=53039
;

-- Jul 24, 2008 9:38:54 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56208, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:38:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50424
;

-- Jul 24, 2008 9:39:05 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56218, IsGroupBy='N', IsPageBreak='N', SortNo=0, XSpace=0, YSpace=0,Updated=TO_TIMESTAMP('2008-07-24 21:39:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50425
;

-- Jul 24, 2008 9:39:13 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56219, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:39:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50426
;

-- Jul 24, 2008 9:39:18 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56220, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:39:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50427
;

-- Jul 24, 2008 9:39:31 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56221, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:39:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50428
;

-- Jul 24, 2008 9:39:38 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56222, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:39:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50429
;

-- Jul 24, 2008 9:39:44 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56224, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:39:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50430
;

-- Jul 24, 2008 9:40:06 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56225, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:40:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50431
;

-- Jul 24, 2008 9:40:12 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56217, IsGroupBy='N', IsPageBreak='N', SortNo=0, XSpace=0, YSpace=0,Updated=TO_TIMESTAMP('2008-07-24 21:40:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50432
;

-- Jul 24, 2008 9:40:21 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56204, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:40:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50433
;

-- Jul 24, 2008 9:40:27 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56227, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:40:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50434
;

-- Jul 24, 2008 9:40:40 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56229, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:40:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50435
;

-- Jul 24, 2008 9:40:46 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56214, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:40:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50436
;

-- Jul 24, 2008 9:40:58 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56212, IsGroupBy='N', IsPageBreak='N', SortNo=0, XSpace=0, YSpace=0,Updated=TO_TIMESTAMP('2008-07-24 21:40:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50437
;

-- Jul 24, 2008 9:41:05 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56200, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:41:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50438
;

-- Jul 24, 2008 9:41:10 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56216, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:41:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50439
;

-- Jul 24, 2008 9:41:21 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56213, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:41:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50440
;

-- Jul 24, 2008 9:41:29 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56228, IsGroupBy='N', IsPageBreak='N', SortNo=0, XPosition=0, YPosition=0,Updated=TO_TIMESTAMP('2008-07-24 21:41:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50441
;

-- Jul 24, 2008 9:43:40 PM CDT
-- Order Distribution
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,56241,53311,0,19,53039,'DD_Order_ID',TO_TIMESTAMP('2008-07-24 21:43:37','YYYY-MM-DD HH24:MI:SS'),0,'EE01',10,'Y','N','N','N','N','N','N','N','N','N','Distribution Order',TO_TIMESTAMP('2008-07-24 21:43:37','YYYY-MM-DD HH24:MI:SS'),0,0)
;

-- Jul 24, 2008 9:43:40 PM CDT
-- Order Distribution
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=56241 AND EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language!=l.AD_Language OR tt.AD_Column_ID!=t.AD_Column_ID)
;

-- Jul 24, 2008 9:44:15 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET AD_Column_ID=56241, IsGroupBy='N', IsPageBreak='N', SortNo=0, XSpace=0, YSpace=0,Updated=TO_TIMESTAMP('2008-07-24 21:44:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_PrintFormatItem_ID=50442
;

-- Jul 24, 2008 9:45:00 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=10,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50361
;

-- Jul 24, 2008 9:45:00 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=20,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50364
;

-- Jul 24, 2008 9:45:00 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=30,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50382
;

-- Jul 24, 2008 9:45:00 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=40,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50385
;

-- Jul 24, 2008 9:45:00 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=50,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50363
;

-- Jul 24, 2008 9:45:00 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=60,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50378
;

-- Jul 24, 2008 9:45:35 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=10,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50378
;

-- Jul 24, 2008 9:45:35 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=20,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50361
;

-- Jul 24, 2008 9:45:35 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=30,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50364
;

-- Jul 24, 2008 9:45:35 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=40,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50382
;

-- Jul 24, 2008 9:45:35 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=50,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50385
;

-- Jul 24, 2008 9:45:35 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SortNo=60,IsOrderBy='Y' WHERE AD_PrintFormatItem_ID=50363
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50369
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50370
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50371
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50372
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50378
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50373
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50374
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50375
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50376
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50377
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50379
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50380
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50381
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50383
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50384
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50385
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50386
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50387
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50388
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50389
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50390
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50391
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50392
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=0,IsPrinted='N' WHERE AD_PrintFormatItem_ID=50393
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=10,IsPrinted='Y' WHERE AD_PrintFormatItem_ID=50361
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=20,IsPrinted='Y' WHERE AD_PrintFormatItem_ID=50362
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=30,IsPrinted='Y' WHERE AD_PrintFormatItem_ID=50363
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=40,IsPrinted='Y' WHERE AD_PrintFormatItem_ID=50364
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=50,IsPrinted='Y' WHERE AD_PrintFormatItem_ID=50382
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=60,IsPrinted='Y' WHERE AD_PrintFormatItem_ID=50365
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=70,IsPrinted='Y' WHERE AD_PrintFormatItem_ID=50366
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=80,IsPrinted='Y' WHERE AD_PrintFormatItem_ID=50367
;

-- Jul 24, 2008 9:47:25 PM CDT
-- Order Distribution
UPDATE AD_PrintFormatItem SET SeqNo=90,IsPrinted='Y' WHERE AD_PrintFormatItem_ID=50368
;

-- Jul 24, 2008 9:55:43 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=10, FieldLength=20,Updated=TO_TIMESTAMP('2008-07-24 21:55:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56197
;

-- Jul 24, 2008 9:56:07 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Val_Rule_ID=129,Updated=TO_TIMESTAMP('2008-07-24 21:56:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56190
;

-- Jul 24, 2008 9:56:40 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Val_Rule_ID=104,Updated=TO_TIMESTAMP('2008-07-24 21:56:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56191
;

-- Jul 24, 2008 9:58:27 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_TIMESTAMP('2008-07-24 21:58:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56224
;

-- Jul 24, 2008 10:02:17 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_Value_ID=131, DefaultValue='DR',Updated=TO_TIMESTAMP('2008-07-24 22:02:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56201
;

-- Jul 24, 2008 10:03:20 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_TIMESTAMP('2008-07-24 22:03:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56213
;

-- Jul 24, 2008 10:04:28 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=21,Updated=TO_TIMESTAMP('2008-07-24 22:04:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56208
;

-- Jul 24, 2008 10:05:36 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=10, FieldLength=20,Updated=TO_TIMESTAMP('2008-07-24 22:05:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56226
;

-- Jul 24, 2008 10:06:13 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=17, AD_Reference_Value_ID=154,Updated=TO_TIMESTAMP('2008-07-24 22:06:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56240
;

-- Jul 24, 2008 10:07:33 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=21,Updated=TO_TIMESTAMP('2008-07-24 22:07:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56211
;

-- Jul 24, 2008 10:07:45 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:07:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56233
;

-- Jul 24, 2008 10:08:03 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:08:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56232
;

-- Jul 24, 2008 10:08:13 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:08:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56196
;

-- Jul 24, 2008 10:08:43 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=7,Updated=TO_TIMESTAMP('2008-07-24 22:08:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56195
;

-- Jul 24, 2008 10:09:31 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:09:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56214
;

-- Jul 24, 2008 10:10:23 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:10:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56208
;

-- Jul 24, 2008 10:10:54 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:10:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56210
;

-- Jul 24, 2008 10:11:07 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:11:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56237
;

-- Jul 24, 2008 10:12:40 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=17, AD_Reference_Value_ID=151,Updated=TO_TIMESTAMP('2008-07-24 22:12:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56239
;

-- Jul 24, 2008 10:15:24 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_ID=17, AD_Reference_Value_ID=151,Updated=TO_TIMESTAMP('2008-07-24 22:15:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56238
;

-- Jul 24, 2008 10:15:34 PM CDT
-- Order Distribution
UPDATE AD_Column SET AD_Reference_Value_ID=152,Updated=TO_TIMESTAMP('2008-07-24 22:15:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56239
;

-- Jul 24, 2008 10:17:06 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=60,Updated=TO_TIMESTAMP('2008-07-24 22:17:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56224
;

-- Jul 24, 2008 10:17:16 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:17:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56231
;

-- Jul 24, 2008 10:17:28 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:17:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56235
;

-- Jul 24, 2008 10:17:37 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:17:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56198
;

-- Jul 24, 2008 10:17:47 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:17:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56225
;

-- Jul 24, 2008 10:17:59 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:17:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56202
;

-- Jul 24, 2008 10:18:10 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:18:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56230
;

-- Jul 24, 2008 10:18:19 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:18:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56234
;

-- Jul 24, 2008 10:18:33 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:18:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56203
;

-- Jul 24, 2008 10:18:41 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:18:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56236
;

-- Jul 24, 2008 10:19:35 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:19:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56191
;

-- Jul 24, 2008 10:20:10 PM CDT
-- Order Distribution
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2008-07-24 22:20:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=56190
;

