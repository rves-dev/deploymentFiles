DELETE FROM sys_email_queue;
DELETE FROM sys_message_queue;
DELETE FROM sys_sequence;
DELETE FROM water_paymentitem;
DELETE FROM water_credit_billitem;
DELETE FROM water_payment;
DELETE FROM water_payment_plan;
DELETE FROM water_discountitem;
DELETE FROM water_billitem_subitem;
DELETE FROM water_billitem;
DELETE FROM water_txn_billitem;
DELETE FROM water_abstract_billitem;

UPDATE water_account SET lastbillid = NULL, taskid = NULL;
DELETE FROM water_txn_bill;
DELETE FROM water_bill;
DELETE FROM water_abstract_bill;

UPDATE water_txn SET taskid = NULL;
DELETE FROM water_txn_task;
DELETE FROM water_txn;

UPDATE water_batch_bill SET taskid = NULL;
DELETE FROM water_batch_bill_task;
DELETE FROM water_account_task;
DELETE FROM water_batch_bill_error;
DELETE FROM water_bill_cancelled;

UPDATE water_billgroup SET currentbatchid = NULL;
DELETE FROM water_batch_bill;

UPDATE water_meter SET currentacctid = NULL;
UPDATE water_account_info SET acctid = NULL;
DELETE FROM water_account;
DELETE FROM water_account_info;


DELETE FROM water_billgroup;
DELETE FROM water_acctgroup;

DELETE FROM water_billschedule;
DELETE FROM water_billschedule_group;
DELETE FROM water_meter;

