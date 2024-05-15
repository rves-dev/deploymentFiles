-- 
-- Script: Delete Business and its corresponding applications 
-- 
-- Parameter: @_BIN
-- 
--
set @_BIN = 'B000002000002'
;
-- 
-- begin process 
-- 
set @businessid = (select objid from business where bin = @_BIN); 
update business_application set permit_objid = null where business_objid = @businessid;
delete from business_permit_lob where parentid in (
	select p.objid 
	from business_application a, business_permit p 
	where a.business_objid = @businessid 
		and p.applicationid = a.objid 
); 
delete from business_permit where applicationid in (
	select objid from business_application 
	where business_objid = @businessid 
);
delete from business_payment_item where parentid in (
	select p.objid 
	from business_application a, business_payment p 
	where a.business_objid = @businessid 
		and p.applicationid = a.objid 
);
delete from business_payment where applicationid in (
	select objid from business_application 
	where business_objid = @businessid 
);
delete from business_receivable where applicationid in (
	select objid from business_application 
	where business_objid = @businessid 
);
delete from business_requirement where applicationid in (
	select objid from business_application 
	where business_objid = @businessid 
);
delete from business_change_log where applicationid in (
	select objid from business_application 
	where business_objid = @businessid 
);
delete from business_application_task_lock where refid in (
	select objid from business_application 
	where business_objid = @businessid 
);
delete from business_application_task where refid in (
	select objid from business_application 
	where business_objid = @businessid 
);
delete from business_application_info where applicationid in (
	select objid from business_application 
	where business_objid = @businessid 
);
delete from business_application_lob where applicationid in (
	select objid from business_application 
	where business_objid = @businessid 
);
delete from business_officefee where applicationid in (
	select objid from business_application 
	where business_objid = @businessid 
);
update business set currentapplicationid = null where objid = @businessid;
update business_application set parentapplicationid = null where business_objid = @businessid;
delete from business_application where business_objid = @businessid;
delete from business_closure where businessid = @businessid;
delete from business_redflag where businessid = @businessid;
delete from business_recurringfee where businessid = @businessid;
delete from business_active_lob_history where businessid = @businessid;
delete from business_active_lob where businessid = @businessid;
delete from business_active_info where businessid = @businessid;
update business set address_objid = null where objid = @businessid;
delete from business_address where businessid = @businessid;
update online_business_application set business_objid = null where business_objid = @businessid;
delete from business where objid = @businessid;
-- 
-- end process 
-- 
