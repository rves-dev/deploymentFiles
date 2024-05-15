use training_etracs_2_5_05_03
; 


REPLACE INTO sys_wf_transition (
	`parentid`, `processname`, `action`, `to`, 
	`idx`, `eval`, `properties`, `permission`, `caption`, `ui`
) VALUES (
	'start', 'business_application', '', 'assign-assessor', 
	-1, 'return (data.apptype.toString().matches("ADDITIONAL|RETIRELOB|RETIRE"));', 
	NULL, NULL, NULL, '[:]'
)
;
