-- 
-- Script: Delete Online Business Application
-- 
--         @_AppNo parameter can either be a 
--                 control number or 
--                 application number
--

set @_AppNo = 'B0000020240400003-1N'
;

-- 
-- 
-- BEGIN
-- 
set @appid = (
	select oa.objid 
	from online_business_application oa 
		left join business_application a on a.objid = oa.objid 
	where (oa.controlno = @_AppNo or a.appno = @_AppNo) 
)
;
delete from online_business_application_doc_fordownload where objid in (
	select objid from online_business_application_doc where parentid = @appid 
)
;
delete from online_business_application_doc where parentid = @appid 
;
delete from online_business_application where objid = @appid 
;
-- 
-- END
--
