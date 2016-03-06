use SMS_C01

select vCS.Name0 as 'Server name',
		vVM.physicalHostName0 as 'Host'

from SMS_C01.dbo.v_GS_COMPUTER_SYSTEM as vcs

join dbo.computer_system_data as CS on CS.MachineID = vcs.ResourceID
join dbo.v_GS_VIRTUAL_MACHINE as vVM on vVM.ResourceID = vcs.ResourceID

where 	CS.Model0 like 'Virtual%'

group by vCS.Name0,
		vVM.physicalHostName0
		
order by vCS.Name0