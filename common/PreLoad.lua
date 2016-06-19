--PreLoad.lua: Pre-Load all music when the game starts. Define the music-control functions.
--call by Prologue.lua if method="PreLoad" is defined in the main script


---------------Define Functions------------------

--Load_Music: Pre-Load all music file to table BGM.
function Load_Music()
	BGM={}; --the table of Sound sample of all music files used by proteaAudio 
	tic=os.clock() --Timer
	count=0; --Count the number of music files loaded
	for k,	v in pairs(music_data) do
		print(string.format("Loading BGM: 0x%04X ....... ",k))
		BGM[k] = proAudio.sampleFromFile(string.format("%s/%s/%s.%s",luapath,directory,v[1],suffix),1.0) --default volume 1.0
		count=count+1
	end
	print(string.format("Complete Loading %d musics",count))
	print(string.format("Loading Time: %f seconds",os.clock()-tic)) --Timer
	emu.message(string.format("HQAudio Loading Complete"))
end

--Play_Music(): Play the music with music code "key": BGM[key]->AudioSample, music_data[key][2]->Title
function Play_Music(key)
	proAudio.soundLoop(BGM[key]) 
	nowplaying=music
	musicname=music_data[key][2];
	emu.message(string.format("%s", musicname))
	Music_Title(musicname)
end

--Stop_Music(): Stop all music and reset the flags.
function Stop_Music()
	proAudio.soundStop();
	nowplaying=nil;
	musicname=nil;
	Music_Title("")
end



---------------Run Script------------------

InitializeAudio();
Load_Music();
print(string.format("\nGAME START\n"))