use SMS_C01

select		vCS.Name0 as 'Server name',
			vIP.IP_Addresses0 'IP',
			vRS.Resource_Domain_OR_Workgr0 as 'Domain'

from SMS_C01.dbo.v_GS_COMPUTER_SYSTEM as vCS

join dbo.v_R_System as vRS on vRS.ResourceID = vCS.ResourceID
join dbo.v_RA_System_IPAddresses as vIP on vIP.ResourceID = vCS.ResourceID

Where 
			vRS.Resource_Domain_OR_Workgr0 like '%[DOMAIN]%'
			and vIP.IP_Addresses0 NOT like '%::%'
	
group by 	vCS.Name0, 
			vIP.IP_Addresses0,
			vRS.Resource_Domain_OR_Workgr0
		
order by vCS.Name0