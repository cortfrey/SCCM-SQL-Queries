use SMS_C01

select	vCS.Name0 as 'Server name',
		OSD.Caption0 as 'Operating System',
		vOS.CSDVersion0 as 'SP Level',
		vRS.Resource_Domain_OR_Workgr0 as 'Domain'

From [SMS_C01].[dbo].[Operating_System_DATA] as OSD

join dbo.computer_system_data as CS on CS.MachineID = OSD.MachineID
join dbo.v_GS_COMPUTER_SYSTEM as vCS on vCS.ResourceID = OSD.MachineID
join dbo.v_R_System as vRS on vRS.ResourceID = OSD.MachineID
join dbo.v_GS_OPERATING_SYSTEM as vOS on vOS.ResourceID = OSD.MachineID
 
Where (vRS.Resource_Domain_OR_Workgr0 like '%[DOMAIN1]%'
	or vRS.Resource_Domain_OR_Workgr0 like '%[DOMAIN2]%')
	and OSD.Caption0 like '%2003%'
	
group by vCS.Name0,  
		OSD.Caption0,
		vOS.CSDVersion0,
		vRS.Resource_Domain_OR_Workgr0
		
order by vCS.Name0