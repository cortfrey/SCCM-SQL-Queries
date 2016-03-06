use SMS_C01

select vSV.Name0 as 'Service', vCS.Name0 as 'Server', vrS.Resource_Domain_OR_Workgr0 as 'Domain'

from v_GS_SERVICE as vSV

join v_GS_COMPUTER_SYSTEM as vCS on vCS.ResourceID = vSV.ResourceID
join v_R_System as vrS on vrS.ResourceID = vSV.ResourceID

where (vSV.Name0 like '%[SERVICE1]%'
	or vSV.Name0 like '%[SERVICE2]%')
	and vrS.Resource_Domain_OR_Workgr0 like '%[DOMAIN]%'

group by 
	vCS.Name0,
	vSV.Name0,
	vrS.Resource_Domain_OR_Workgr0
	
order by 
	vrS.Resource_Domain_OR_Workgr0