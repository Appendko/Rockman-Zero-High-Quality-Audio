--MainLoop.lua: The Routines which needs to run everyframe


---------------Run Script------------------

--Read the Current Music Code first.
music=memory.readword(addr_music);	

--Sound Volume Control: PageUp/PageDown
InputTable=input.get();
if InputTable["pageup"]   and emu.framecount()%5==0 and volume<100 then volume=volume+1;proAudio.volume(volume/50.0);sound_change=true end
if InputTable["pagedown"] and emu.framecount()%5==0 and volume>0   then volume=volume-1;proAudio.volume(volume/50.0);sound_change=true end
if sound_change then emu.message(string.format("HQAudio Volume: %d/100",volume));sound_change=nil; end

--Display Music Code: Home/End
if InputTable["home"] then flag_addr=true end
if InputTable["end"]  then flag_addr=nil  end
if flag_addr then gui.text(11,0,string.format("0x%04X",music), "yellow") end

--Low Quality Mode: Insert/Delete 
--if InputTable["insert"] then flag_LQ=true;  end
--if InputTable["delete"]  then flag_LQ=false; end
--if flag_LQ then gui.text(1,0,string.format("LQ"), "red") end

--mapping() function is defined in Header() to deal with game-specific cases, to mapping specific Music code to another artificially.
--For example: To avoid the replacement of the ED of Zero 2 with Guarder Room
--For example: The TitleIV of Zero 4 is actually 3 music; I decided to ignore the first, and use the same one for the other 2.
mapping();

--The external music should be stopped if the addr_stopcheck=0xFF, except for the ED. 
--Or, if the Low Quality Mode is enabled, stop the external music.
if(memory.readbyte(addr_stopcheck)==value_stopflag and music~=addr_ED ) or music==0x0000 or flag_LQ then Stop_Music()
else
	--If the music code is listed in FileList.txt,  Mute GBA music (except for TAS), and Play the corresponding external music.
	if music_data[music] then
		if movie.playing()==false then Mute() end 
		if nowplaying~=music then Stop_Music() end --Stop the external music before change to the new one.	
		if proAudio.soundActive()==0 then Play_Music(music)	end; --Start the external music if it is not already playing.	
	--If the music code is not-in-list, stop the external music, and play the GBA sound.
	else Stop_Music() 
	end
	--Display the HQ mark if any external music is playing.
	if proAudio.soundActive()~=0 then 
		gui.text(1,0,string.format("HQ"), "yellow")
	else
		--Reset the nowplaying flag if there isn't any external music playing.
		nowplaying=nil 
		--If the addr_stopcheck isn't 0xFF but the external music is not playing, that means GBA sound is working now.
		if(memory.readbyte(addr_stopcheck)~=value_stopflag) then gui.text(0,0,"LQ", "red") end		
	end	
end
