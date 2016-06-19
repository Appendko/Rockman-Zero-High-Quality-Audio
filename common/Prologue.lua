--Prologue.lua: Routines run when the game loads: Filelist, and Audio device


---------------Define Functions------------------

--Load_FileList(): Load the FileList.txt in the corresponding music directory
--Format: Code_JP[TAB]Code_US[TAB]Code_EU[TAB]Filename[TAB]Music Title[TAB]--Comments
function Load_FileList()
	music_data={}; --Structure of music_data-> music_data[0x2B88]={"01","Title II"}
	local file = io.open(string.format("%s/%s/%s",luapath,directory,filelist))
	if file then
		for line in file:lines() do
			--Format: Code_JP[TAB]Code_US[TAB]Code_EU[TAB]Filename[TAB]Music Title[TAB]--Comments
			local keyJP, keyUS, keyEU, filename, musictitle, comment = line:match("([%Z]+)\t([%Z]+)\t([%Z]+)\t([%Z]+)\t([%Z]+)\t(%-%-[%C]+)")
			if line then print(line) end
			if musictitle == nil then musictitle = "" end;
			local key=nil;
			if(region==JP) then key=keyJP;	elseif (region==US) then key=keyUS;	else key=keyEU end
			--add to music_data only if the data is available
			if(tonumber(key) and filename) then music_data[tonumber(key)]={filename,musictitle} end
		end
		file:close();
	else
		print(string.format("Error: Unable to open %s/%s/%s",luapath,directory,filelist))
		return 1
	end
end

--InitializeAudio(): Initialize the proteaAudio device, then ask the emu to unload it when the script ends.
function InitializeAudio()
	-- Create an audio device using default parameters and exit in case of errors
	require("proAudioRt")
	if not proAudio.create(1,44100,2048) then
		print("Error: Cannot create proAudio device.")
		return 1
	end
	-- Set the default volume to 1.0: Similar to GBA Music
	proAudio.volume(volume/50.0);
	-- Ask the emu to unload it when the script ends.
	emu.registerexit(proAudio.destroy);
end

--UnloadAudio(): Unload the audio device.
function UnloadAudio()
	proAudio.destroy()
end

--mute(): Turn off the GBA music by mimicking the status of dying. This will change something in the memory and thus affect the behavior of TAS.
function Mute()
	--memory.writebyte(addr_mute, 0x00)
	memory.writebyte(addr_mute+0x02, 0x06) --0x06 when dying
	memory.writebyte(addr_mute+0x04, 0x01) --decrease the next byte once whenever this becomes 0x00.
	memory.writebyte(addr_mute+0x06, 0x00) 
end

--music_title(): Write the title of current music to text file.
function Music_Title(musictitle)
	local file = io.open(string.format("%s/NowPlaying.txt",luapath),"w")
	if file then
		file:write(string.format("%s",musictitle))
		file:close();
	else
		print(string.format("Error: Unable to open %s/NowPlaying.txt",luapath))
	end
end

-- Method-dependent Routines run when the game loads: PreLoad or DirectLoad
-- Define the music-control functions.
LoadMethod=loadfile(string.format("%s/common/%s.lua",luapath,method));


---------------Run Script------------------

--Clear the variables
nowplaying=nil
BGM=nil;
music_data=nil;

--Load the List of Music File
if Load_FileList() then return 1;
--Method-Dependent Routine
elseif LoadMethod() then return 1;
end
