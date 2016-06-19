--Main.lua: The main routine of the project "Rockman Zero-High Quality Audio". 
--This file call all routines as functions and form the loop structure.
--Need the definition of "suffix"(either "ogg" or "wav") and "method" (either "PreLoad" or "DirectLoad")

----------------------Introduction----------------------------

--Rockman Zero-High Quality Audio utilize the lua script interface of VBA-rerecording to:
--(1) Find out the currently played music 
--(2) Turn off the music played by GBA (by mimicking the dying status)
--(3) Use proteaAudio Library to play the corresponding music from Remastered Tracks Rockman Zero.

-------------Detect the path for the lua file------------------

--It's wired, but the default path "./lua/" sometimes turns into "./", and I have no idea about why this happened.
--Therefore, I decide to use the absolute path instead of the relative "./lua/something...."
luapath=debug.getinfo(2, "S").source:sub(2):match("([%Z]+)\\[%Z]+.lua");
print(string.format("Working Directory: %s",luapath));


---------------Define Functions------------------

 Initialization=loadfile(string.format("%s/common/Initialization.lua",luapath))		-- The General terms which only need to run once.
GameRecognition=loadfile(string.format("%s/common/GameRecognition.lua",luapath))	-- Game recognition and Load the Game-specific constants.
       Prologue=loadfile(string.format("%s/common/Prologue.lua",luapath))			-- Routines run when the game loads: Filelist, and Audio device
       MainLoop=loadfile(string.format("%s/common/MainLoop.lua",luapath))			-- The Routines which needs to run everyframe
       Epilogue=loadfile(string.format("%s/common/Epilogue.lua",luapath))			-- Routines run before the game unloads

	   
---------------Run Script------------------

Initialization(); --only need to run once.
while true do	
	--Run once when the game load
	if memory.readdword(addr_rom)~=code then
		if code~=0x00 then Epilogue() end --only if the game changes, do not run in the first time.
		if GameRecognition() then code=0x00; --Game recognition: return 1 if the rom is not supported.
		else
			if Prologue() then break end		--stop when error
		end
	end
	
	--Run the MainLoop only if the ROM is supported
	if code~=0x00 then MainLoop() end
	
	--Continue to next frame
	emu.frameadvance()
end
