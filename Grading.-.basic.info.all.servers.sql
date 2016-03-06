use SMS_C01

select	vCS.Name0 as 'Server name',
		OSD.Caption0 as 'Operating System',
		OSD.InstallDate0 as 'Install Date',
		CS.Manufacturer00 as 'Manufacturer',
		CS.Model0 as 'Model'

From [SMS_C01].[dbo].[Operating_System_DATA] as OSD

join dbo.computer_system_data as CS on CS.MachineID = OSD.MachineID
join dbo.v_GS_COMPUTER_SYSTEM as vCS on vCS.ResourceID = OSD.MachineID

group by vCS.Name0, 
		OSD.InstallDate0, 
		CS.Model0, 
		CS.Manufacturer00, 
		OSD.Caption0

order by vCS.Name0