use SMS_C01

select vSE.SerialNumber0

from v_GS_SYSTEM_ENCLOSURE vSE
join v_R_System as vrS on vrS.ResourceID = vSE.ResourceID

where vrs.Name0 like '%augs1mgm46%'