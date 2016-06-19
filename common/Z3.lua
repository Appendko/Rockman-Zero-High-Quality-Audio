if region == JP then
	addr_mute=0x0203E892
	addr_music=0x0203E870
	addr_stopcheck=0x0202FFC8
	value_stopflag=0xFF
	addr_ED=0x6A90
elseif region == US then
	addr_mute=0x0203EBD2
	addr_music=0x0203EBB0
	addr_stopcheck=0x02030308
	value_stopflag=0xFF 
	addr_ED=0x3268 
elseif region == EU then
	addr_mute=0x0203EBD2
	addr_music=0x0203EBB0
	addr_stopcheck=0x02030308
	value_stopflag=0xFF 
	addr_ED=0x3214 
end

mapping=function ()
end
