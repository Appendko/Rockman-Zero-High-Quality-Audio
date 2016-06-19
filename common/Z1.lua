addr_mute=0x0202F9D2
addr_music=0x0202F9B0
addr_stopcheck=0x02022CC4
value_stopflag=0xFF

if region == JP then
	addr_ED=0xE430
elseif region == US then
	addr_ED=0xE32C
elseif region == EU then --not found yet
	addr_ED=0xE32C
end

mapping=function ()
end
