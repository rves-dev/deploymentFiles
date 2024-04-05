-- 
-- reset to factory defaults
-- 
update market_txn set taskid = null;

delete from market_txn_billitem;
delete from market_txn_bill;
delete from market_txn_task;
delete from market_txn;

delete from market_credit_paymentitem;
delete from market_credit_billitem;
delete from market_discountitem;

delete from market_billitem_subitem;
delete from market_billitem;
delete from market_bill_cancelled;
delete from market_bill;

delete from market_paymentitem;
delete from market_payment_plan;
delete from market_payment;

delete from market_abstract_billitem;
delete from market_abstract_bill;

update market_account set taskid = null, acctinfoid = null; 
update market_rental_unit set currentacctid = null;

delete from market_account_task;
delete from market_account_info;
delete from market_account;

delete from sys_email_queue;
delete from sys_message_queue;
delete from sys_sequence;


update market_rental_rate set batchid = null; 

delete from market_batch_rental_rate; 

update market_center set schedulegroupid = null; 

delete from market_billschedule;
delete from market_billschedule_group;

delete from market_rental_rate;
delete from market_rental_unit;

update market_section set parentid = null; 

delete from market_section;

delete from market_center; 

delete from market_tag; 

delete from sys_user_role;
delete from sys_user;
