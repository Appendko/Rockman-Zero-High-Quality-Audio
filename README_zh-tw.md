# Rockman-Zero-High-Quality-Audio
基於VBA-ReRecording模擬器的Lua Script功能，即時播放高音質的Remastered Tracks Rockman Zero音軌來取代遊戲音樂。

---------------------------------------
## 簡介
Rockman Zero-High Quality Audio 透過Lua腳本功能讓VBA-rerecording模擬器進行以下動作：  
 - 找出現在GBA正在播放的音樂  
 - 讓GBA正在播放的音樂消音 (模仿死亡狀態)  
 - 利用**proteaAudio**來播放Remastered Tracks Rockman Zero中對應的音軌  

---------------------------------------
## 需求
[VBA-rerecording](https://code.google.com/archive/p/vba-rerecording/)  

[proteaAudio](http://viremo.eludi.net/proteaAudio/)  
(proAudioRt.dll for Windows)  

Remastered Tracks Rockman Zero  
這些音軌必須放到指定的資料夾中，並且按照*FileList.txt*指定的順序更改檔案名稱。  

---------------------------------------
## 使用方式
這個套件包房了一些Lua腳本(放在**common**資料夾中)，4個FileList.txt(放在各自的音樂資料夾中)和3個用來執行的Lua腳本. Remastered Tracks Rockman Zero的音軌必須放到指定的資料夾中，並且按照*FileList.txt*指定的順序更改檔案名稱。  

在VBA-rerecording中開啟Rom (Z1~Z4, 日/美/歐版皆可)，  
點選 Tools -> Lua Scripting -> New Lua Script window....， 點選 Browse，選擇 **RMZ\_HQAudio\_ogg.lua**，  
然後點選**Run** - 這會讀取大約一分鐘左右，並且占用1GB記憶體。  
Lua Console視窗出現GAME START就表示讀取完成。  
左上角顯示HQ就是現在正在播放的是Remastered Tracks Rockman Zero中的音軌。  
此外，更換Rom時，這個腳本會自動讀取對應的音樂檔案。  

音量控制：在遊戲過程中，請用PageUp和PageDown調整音樂音量，最小為0，最大為100。  
音樂代碼：在遊戲過程中，請用Home/End打開/關閉音樂代碼顯示。  
文字輸出：在遊戲過程中，會產生一個NowPlaying.txt，這個檔案會即時更新當前播放的曲目名字。  

---------------------------------------
## 減少讀取時間 
因為所有音樂都要預先載入，遊戲過程需要大約1GB多一些的RAM。同時還要解碼ogg檔案，因此大約要一分鐘。  
因此我另外提供了四個批次檔 (例如**CreateWav\_Z1.bat**)將所有的ogg檔案轉換成wav檔案。  
這需要[OggDec](http://www.rarewares.org/ogg-oggdec.php) (for windows)  

這四個批次檔 (例如**CreateWav\_Z1.bat**)會將所有的ogg檔案解碼成wav檔案，  
每款遊戲的音樂大約需要1GB的硬碟空間。  
在這之後，你可以使用 **RMZ\_HQAudio\_wav.lua** 來在遊戲過程東讀取wav檔案。  
讀取所有檔案過程大約需要5秒，仍然需要1GB的記憶體。  

如果你對這個記憶體使用量很不滿意，  
**RMZ\_HQAudio\_wav\_direct.lua** 是設計來在播放每一首音軌的時候才進行讀取。  
對於每個音樂檔案都需要0.1~0.5秒的讀取時間，也就是說遊戲過程中每次音樂切換都會有一個小延遲。  

## 授權
GNU GPL v2

-------------------------------------------

## 原始碼
Rockman Zero-High Quality Audio (GitHub):  
https://github.com/Appendko/Rockman-Zero-High-Quality-Audio

--------------------------------------------
## 作者
Append Huang (Append@gmail.com)

--------------------------------------------
## 參考資料
[VBA-Rerecording: Lua Scripting Functions](http://tasvideos.org/EmulatorResources/VBA/LuaScriptingFunctions.html)  

[proteaAudio Library](http://viremo.eludi.net/proteaAudio/)  

---------------------------------------------
## 感謝
感謝 **Fuunkao Sekai**(https://github.com/fsworld009) 在消音GBA播放的音樂上的幫助，以及對於簡化程式碼的建議。  

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
