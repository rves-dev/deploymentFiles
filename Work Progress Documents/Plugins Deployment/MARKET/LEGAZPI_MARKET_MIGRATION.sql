-- LEGAZPI MARKET MIGRATION
-- -------------------------
-- 1. replace 
--    marketdb_legazpi == target database name 
--    market_legazpi == source database name
--  

INSERT IGNORE INTO marketdb_legazpi.market_billschedule_group
SELECT * FROM market_legazpi.market_billschedule_group;

INSERT INTO marketdb_legazpi.market_billschedule
SELECT * FROM market_legazpi.market_billschedule;

INSERT INTO marketdb_legazpi.market_center
SELECT * FROM market_legazpi.market_center;

INSERT INTO marketdb_legazpi.market_section
SELECT * FROM market_legazpi.market_section;

INSERT INTO marketdb_legazpi.sys_sequence
SELECT * FROM market_legazpi.sys_sequence;

INSERT INTO marketdb_legazpi.sys_user (objid,username,firstname,lastname,middlename,name,jobtitle,txncode)
SELECT objid,username,firstname,lastname,middlename,name,jobtitle,txncode FROM market_legazpi.sys_user;

INSERT INTO marketdb_legazpi.sys_user_role
SELECT * FROM market_legazpi.sys_user_role;


INSERT INTO marketdb_legazpi.market_tag
SELECT * FROM market_legazpi.market_tag;

INSERT INTO marketdb_legazpi.market_rental_unit
(objid,state,centerid,sectionid,unitno,unittype,indexno,areasqm,schedulegroupid,uid)
SELECT objid,state,centerid,sectionid,unitno,unittype,indexno,areasqm,schedulegroupid,uid FROM market_legazpi.market_rental_unit;

INSERT INTO marketdb_legazpi.market_batch_rental_rate
SELECT * FROM market_legazpi.market_batch_rental_rate;

INSERT INTO marketdb_legazpi.market_rental_rate
SELECT * FROM market_legazpi.market_rental_rate;

INSERT INTO marketdb_legazpi.market_account (objid,acctno,remarks)
SELECT objid,acctno,remarks FROM market_legazpi.market_account;

INSERT INTO marketdb_legazpi.market_account_task
SELECT * FROM market_legazpi.market_account_task;

INSERT INTO marketdb_legazpi.market_account_info
SELECT * FROM market_legazpi.market_account_info;

INSERT INTO marketdb_legazpi.market_txn (objid,controlno,txntypeid,remarks,acctid,oldacctinfoid,newacctinfoid,info)
SELECT objid,controlno,txntypeid,remarks,acctid,acctinfoid,newacctinfoid,info FROM market_legazpi.market_txn;

INSERT INTO marketdb_legazpi.market_txn_task
SELECT * FROM market_legazpi.market_txn_task;

INSERT INTO marketdb_legazpi.market_abstract_bill
SELECT * FROM market_legazpi.market_abstract_bill;

INSERT INTO marketdb_legazpi.market_abstract_billitem
SELECT * FROM market_legazpi.market_abstract_billitem;

UPDATE market_legazpi.market_account a, marketdb_legazpi.market_account b
SET b.acctinfoid = a.acctinfoid, b.taskid = a.taskid, b.lastbillid = a.lastbillid
WHERE b.objid = a.objid;

UPDATE market_legazpi.market_txn a, marketdb_legazpi.market_txn b
SET b.taskid = a.taskid
WHERE b.objid = a.objid;

UPDATE market_legazpi.market_rental_unit a, marketdb_legazpi.market_rental_unit b
SET b.currentacctid = a.currentacctid
WHERE b.objid = a.objid;

UPDATE market_legazpi.market_itemaccount a, marketdb_legazpi.market_itemaccount b
SET b.item_objid = a.item_objid, b.item_code=a.item_code, b.item_title=a.item_title
WHERE b.objid = a.objid;


INSERT INTO marketdb_legazpi.market_bill (objid,prevbillid,billno,billdate,lasttxndate,validitydate,duedate,acctid,acctinfoid,state,remarks,balanceforward,totalpayment,interest,surcharge,amount,discount,txnmode,uid,scheduleid,dtprinted,rateid)
SELECT objid,prevbillid,billno,billdate,lasttxndate,validitydate,duedate,acctid,acctinfoid,state,remarks,balanceforward,totalpayment,interest,surcharge,amount,discount,txnmode,uid,scheduleid,dtprinted,rateid FROM market_legazpi.market_bill;

INSERT INTO marketdb_legazpi.market_bill_cancelled
SELECT * FROM market_legazpi.market_bill_cancelled;

INSERT INTO marketdb_legazpi.market_txn_bill
SELECT * FROM market_legazpi.market_txn_bill;

INSERT INTO marketdb_legazpi.market_billitem
SELECT * FROM market_legazpi.market_billitem;

INSERT INTO marketdb_legazpi.market_txn_billitem ( objid,paymentplanid)
SELECT  objid,paymentplanid  FROM market_legazpi.market_txn_billitem;

INSERT INTO marketdb_legazpi.market_billitem_subitem
SELECT * FROM market_legazpi.market_billitem_subitem;


INSERT INTO marketdb_legazpi.market_credit_billitem
SELECT * FROM market_legazpi.market_credit_billitem;

INSERT INTO marketdb_legazpi.market_payment
SELECT * FROM market_legazpi.market_payment;

INSERT INTO marketdb_legazpi.market_discountitem
SELECT * FROM market_legazpi.market_discountitem;


INSERT INTO marketdb_legazpi.market_paymentitem
SELECT * FROM market_legazpi.market_paymentitem;







