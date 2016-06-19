--DirectLoad.lua: Load the music only when needed. Define the music-control functions.
--call by Prologue.lua if method="DirectLoad" is defined in the main script


---------------Define Functions------------------

--Play_Music(): Play the music with music code "key": BGM->AudioSample, music_data[key][2]->Title
function Play_Music(key)
	tic=os.clock()	--Timer
	BGM = proAudio.sampleFromFile(string.format("%s/%s/%s.%s",luapath,directory,music_data[key][1],suffix),1.0) 
	print(string.format("Loading BGM: 0x%04X ....... %f seconds\n",key,os.clock()-tic)) --Timer
	proAudio.soundLoop(BGM) 
	nowplaying=music	
	musicname=music_data[key][2];
	emu.message(string.format("%s", musicname))
	Music_Title(musicname)
end

--Stop_Music(): Stop all music and reset the flags.
function Stop_Music()
	proAudio.soundStop();
	if BGM then proAudio.sampleDestroy(BGM); BGM=nil; end
	nowplaying=nil;
	musicname=nil;
	Music_Title("")
end


---------------Run Script------------------

InitializeAudio();
print(string.format("\nGAME START\n"))