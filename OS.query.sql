use SMS_C01

select	vCS.Name0 as 'Server name',
		OSD.Caption0 as 'OS'		

From [SMS_C01].[dbo].[Operating_System_DATA] as OSD

join dbo.computer_system_data as CS on CS.MachineID = OSD.MachineID
join dbo.v_GS_COMPUTER_SYSTEM as vCS on vCS.ResourceID = OSD.MachineID

where		CS.Model0 not like '%DG%'
		and	CS.Model0 not like '%PROTECH%'
		and	CS.Model0 not like 'PDS%'
		and CS.Model0 not like 's3210SH'
		and CS.Model0 not like 'awrdacpi'
		and CS.Model0 not like 'Ruby-%'
		
group by	vCS.Name0, 
			OSD.Caption0
			
order by vCS.Name0