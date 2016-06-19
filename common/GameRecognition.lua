--GameRecognition.lua: Game recognition and Load the Game-specific constants.


---------------Run Script------------------

--Game Recognition
code=memory.readdword(addr_rom);
if gamecode[code] == nil then 
	print("This ROM code is not supported")
	return 1 
end

region=memory.readbyte(addr_rom+0x03); --0x4A for JP, 0x45 for US, 0x50 for EU
game=memory.readword(addr_rom); --0x5A41/0x5241 for Z1J/Z1U, 0x3641 for Z2, 0x5A42 for Z3, 0x3442 for Z4
print(string.format("0x%08X %X %s",code,region,gamedata[game]))

-- define game-specific terms
directory=string.format("%s_%s",gamedata[game],suffix)
filelist=string.format("FileList.txt")
Header=HeaderTable[game]
if Header==nil then print("Load Failed, Please restart the script");return 1;end
Header()

