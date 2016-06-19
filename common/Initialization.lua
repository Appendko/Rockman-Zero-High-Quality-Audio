--Initialization.lua: The General terms which only need to run once.


---------------Run Script------------------

--initial value of volume: This should not change when game change.
if volume==nil then volume = 50 end 

--Definition of Constants about Game Recognition
addr_rom=0x080000AC; --ROM code address
code=0x00000000;
gamecode={};
gamecode[0x4A5A5241]="RMZ1"--JP
gamecode[0x45435A41]="MMZ1"--US
gamecode[0x50435A41]="MMZ1"--EU

gamecode[0x4A323641]="RMZ2"--JP
gamecode[0x45323641]="MMZ2"--US
gamecode[0x50323641]="MMZ2"--EU

gamecode[0x4A335A42]="RMZ3"--JP
gamecode[0x45335A42]="MMZ3"--US
gamecode[0x50335A42]="MMZ3"--EU

gamecode[0x4A5A3442]="RMZ4"--JP
gamecode[0x455A3442]="MMZ4"--US
gamecode[0x505A3442]="MMZ4"--EU

--region=memory.readbyte(addr_rom+0x03); --0x4A for JP, 0x45 for US, 0x50 for EU
JP=0x4A;US=0x45;EU=0x50;
--game=memory.readword(addr_rom);
Z1J=0x5A41;Z1U=0x5241;Z2=0x3641;Z3=0x5A42;Z4=0x3442;

gamedata={[Z1J]="Z1",[Z1U]="Z1",[Z2]="Z2",[Z3]="Z3",[Z4]="Z4"}

--Constants of different games. => Tables of functions. 
HeaderTable={} 
HeaderTable[Z1J]=loadfile(string.format("%s/common/Z1.lua",luapath)) 
HeaderTable[Z1U]=loadfile(string.format("%s/common/Z1.lua",luapath)) 
 HeaderTable[Z2]=loadfile(string.format("%s/common/Z2.lua",luapath)) 
 HeaderTable[Z3]=loadfile(string.format("%s/common/Z3.lua",luapath)) 
 HeaderTable[Z4]=loadfile(string.format("%s/common/Z4.lua",luapath))
