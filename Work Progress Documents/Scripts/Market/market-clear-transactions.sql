
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
