-- 
-- Script: Delete Business Application Only
-- 
-- Parameter: @appno
-- 
--
set @appno = 'B16020221200001-3R'
;
-- 
-- begin process 
-- 
set @appid = (select objid from business_application where appno = @appno); 
set @businessid = (select business_objid from business_application where objid = @appid); 
update business_application set permit_objid = null where objid = @appid; 
delete from business_permit_lob where parentid in (select objid from business_permit where applicationid = @appid); 
delete from business_permit where applicationid = @appid; 
delete from business_payment_item where parentid in (select objid from business_payment where applicationid = @appid);
delete from business_payment where applicationid = @appid;
delete from business_receivable where applicationid = @appid;
delete from business_requirement where applicationid = @appid;
delete from business_change_log where applicationid = @appid;
delete from business_application_task_lock where refid = @appid;
delete from business_application_task where refid = @appid;
delete from business_application_info where applicationid = @appid;
delete from business_application_lob where applicationid = @appid;
delete from business_officefee where applicationid = @appid;
update business set currentapplicationid = null where objid = @businessid;
delete from business_application where objid = @appid;
set @currentappid = ( 
	select objid from business_application 
	where business_objid = @businessid and parentapplicationid IS NULL 
	order by appyear desc, txndate desc limit 1 
);
set @appcount = ( 
	select count(*) from business_application 
	where business_objid = @businessid 
);
update business set 
	appcount = @appcount, 
	currentapplicationid = @currentappid 
where objid = @businessid
;
update business b, business_application ba set 
	b.apptype = ba.apptype, 
	b.state = (case when ba.state = 'COMPLETED' then 'ACTIVE' else 'PROCESSING' end) 
where ba.objid = b.currentapplicationid 
-- 
-- end process 
-- 
