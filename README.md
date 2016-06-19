# Rockman-Zero-High-Quality-Audio
Lua scripts for VBA-rerecording to replace GBA Rockman Zero (1~4) game music with Remastered Tracks Rockman Zero.

---------------------------------------
## Introduction
Rockman Zero-High Quality Audio utilize the lua script interface of VBA-rerecording to:  
 - Find out the currently played music  
 - Turn off the music played by GBA (by mimicking the dying status)  
 - Use **proteaAudio Library** to play the corresponding music from Remastered Tracks Rockman Zero

---------------------------------------
## Requirement
[VBA-rerecording](https://code.google.com/archive/p/vba-rerecording/)

[proteaAudio Library](http://viremo.eludi.net/proteaAudio/)  
(proAudioRt.dll for Windows)

Remastered Tracks Rockman Zero
The tracks should be placed into the directories and renamed to match the data in *FileList.txt*.

---------------------------------------
## Usage
This package consist of a few lua scripts (in the directory **common**), 4 FileList.txt (in the music directory) and 3 lua scripts for execution. The RTRZ music tracks should be placed into the directories and renamed to match the data in *FileList.txt*.

In VBA-rerecording, Open the rom (Z1~Z4, JP/US/EU version),
click on Tools -> Lua Scripting -> New Lua Script window...., Browse for **RMZ\_HQAudio\_ogg.lua**, 
then press **Run** - This will need about *one minute* for loading all music into memory *(about 1GB)*.
When the loading is finished, you'll see **GAME START** in the lua console.
The **HQ** at the upperleft corner will appear whenever the RTRZ tracks are playing.
Besides, the script will load the corresponding music files automatically when you load a different rom.

Volume Control: During the gameplay, press PageUp/PageDown for volume control (0 to 100).
Music Code: During the gameplay, press Home/End to turn on/off the display of Music Code.
Text output: During the gameplay, you'll find a **NowPlaying.txt** which contains the title of the current music.

---------------------------------------
## Reduce Loading time 
The decoding of 40 ogg files needs about 0.5 to 1 minute - which is quite long. 
Therefore I provided 4 batch files (such as **CreateWav\_Z1.bat**) to convert all ogg files to wav files.
It requires [OggDec](http://www.rarewares.org/ogg-oggdec.php) (for windows)

These batch files will decode the ogg files into the wav files. 
It Need about *1GB Hard disk space* for each game.
After the decoding process, you can use **RMZ\_HQAudio\_wav.lua** to load the *decoded wav files* instead of ogg files. 
It need less than 5 seconds and 1GB of memory to load all wave files,

If you are not satisfied with the memory usage, 
**RMZ\_HQAudio\_wav\_direct.lua** is designed to *load the specific music when it's necessary* and unload it when it's not.
It need about 0.1~0.5 seconds for a music file, that means the gameplay will have a short interrupt for ever music changes.

## Licence
GNU GPL v2

-------------------------------------------

## Source Code
Rockman Zero-High Quality Audio (GitHub):
https://github.com/Appendko/

--------------------------------------------
## Author
Append Huang (Append@gmail.com)

--------------------------------------------
## Reference
[VBA-Rerecording: Lua Scripting Functions](http://tasvideos.org/EmulatorResources/VBA/LuaScriptingFunctions.html)

[proteaAudio Library](http://viremo.eludi.net/proteaAudio/)  

---------------------------------------------
## Acknowledgment
I would like to express my special thanks to **Fuunkao Sekai**(https://github.com/fsworld009) for the help to interrupt the GBA music and the advice to simplify the lua code.

---------------------------------------
## Changelog 

###20160619
Improve the modularity

###20160617  
Display the volume as VBA message  
Output the current music title to a text file  
Use Home/End to turn on/off the music code display
Improve the modularity
 
###20160616  
Add the support to JP/US/EU Roms  
Resolve the failure when terminating the script
Resolve the failure after change roms
Resolve the failure if change into a non-RMZ rom  
Improve the modularity  
Add the Volume Control and change the default volume to 1.0

 
###20160615  
Modularize all lua codes  
Add the support to JP/US Roms  
Auto recognize the current game  
Add the support for the changing roms during gameplay  
Change the default volume to 1.0  
Add the criteria to avoid the credits themes being interrupted

###20160614
Add the support to RMZ1~RMZ4

###20160613
Add the support to RMZ2

###20160612
Add the support to RMZ3  
Add the support to play wav instead of ogg  
Add the support to load the music whenever it's necessary
