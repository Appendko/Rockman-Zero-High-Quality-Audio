addr_mute=0x0203E972
addr_music=0x0203E950 
addr_stopcheck=0x0202ED98
value_stopflag=0xFF

if region == JP then
	addr_ED=0xFEF8
	addr_Encounter=0x759C
elseif region == US then
	addr_ED=0x0CB0 
	addr_Encounter=0x8354
elseif region == EU then
	addr_ED=0x0CB0 
	addr_Encounter=0x8354
end

mapping=function ()
	--Avoid the interruption of Guarder Room after the Ending song
	if(music == addr_Encounter and nowplaying == addr_ED ) then music=addr_ED end  
end
