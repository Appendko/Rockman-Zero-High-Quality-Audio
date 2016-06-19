addr_mute=0x0203D542
addr_music=0x0203D520 
addr_stopcheck=0x0202EA78
value_stopflag=0xFF

if region == JP then
	addr_ED=0x6844
	addr_TITLE1=0x8EC8
	addr_TITLE2=0x3804
	addr_TITLE3=0xAD9C
elseif region == US then
	addr_ED=0x3300
	addr_TITLE1=0x5984
	addr_TITLE2=0x0480
	addr_TITLE3=0x7858
elseif region == EU then
	addr_ED=0x32B0
	addr_TITLE1=0x5934
	addr_TITLE2=0x0430
	addr_TITLE3=0x7808
end

mapping=function ()
	--Z4 avoid the interruption of Title2
	if(music == addr_TITLE3 ) then music=addr_TITLE2 end  
end