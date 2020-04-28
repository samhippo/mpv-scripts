
# mpv-scripts
## Scripts
* [custom-osc](#%EF%B8%8F---custom-osclua)
* [simple context menu](#%EF%B8%8F---simple-context-menu)
* [delete-file](#%EF%B8%8F---delete-filelua)
* [move-file](#%EF%B8%8F---move-filelua)
* [move-file-datetime](#%EF%B8%8F---move-file-datetimelua)
* [move-file-subfolder](#%EF%B8%8F---move-file-subfolderlua)
* [cut-video](#%EF%B8%8F---cut-videolua)
* [load-dir](#%EF%B8%8F---load-dirlua)
* [load-dir-auto](#%EF%B8%8F---load-dir-autolua)
* [clean-playlist](#%EF%B8%8F---clean-playlistlua)
## Other
* [Notes](#Notes)
* [Installing Files](#Installing-Files)
## ▶️  &nbsp; custom-osc.lua
A minimal on screen controller desgined to use the entire window.

Basic Functionality
* Left Click Sides = Next/Prev
* Left Click Center = Play/Pause 
* Double Left Click center = Toggle Fullscreen
* Left Click Bottom = Seekbar
* Right Click Anywhere = Drag-Seek

![](screenshots/osc_image4.png)
#### Installation
1. Copy [custom-osc.lua](custom-osc.lua) to your mpv scripts directory.
2. Add the following commands to **input.conf**
```
MBTN_LEFT       script_message custom-osc-left-click
MBTN_LEFT_DBL   script_message custom-osc-left-double-click
MBTN_RIGHT      ignore
MOUSE_MOVE      script_message custom-osc-mouse-move
WHEEL_UP        osd-msg add volume 10
WHEEL_DOWN      osd-msg add volume -10
```
3. Add the following commands to **mpv.conf**
```
osc=no
no-window-dragging
osd-margin-x=10
osd-margin-y=10
osd-bar-w=100
osd-bar-h=1
osd-bar-align-x=0
osd-bar-align-y=1
osd-border-size=2
osd-font-size=35
osd-scale-by-window=no
title= [${playlist-pos-1}/${playlist-count}] [${duration}] [${file-size}]   ${filename}
osd-status-msg=${time-pos} / ${duration} \nPL ${playlist-pos-1}/${playlist-count}
```
##  ▶️  &nbsp; Simple Context Menu
Simple context menu created with AHK (AutoHotKey). No modification to mpv is necessary for this contextmenu.

![](screenshots/cm_image1.png)
#### Installation
1. AutoHotKey is required for this functionality. Download and install from here [AHK](https://www.autohotkey.com)
2. Download the script [mpv-contextmenu.ahk](mpv-contextmenu.ahk) to any directory and open with AHK.
3. Modify mpv-contextmenu.ahk as needed to add context menu items.

#### Usage
This ahk script invokes a contextmenu when the right mouse button is clicked on an mpv window. It then sends hotkeys to mpv based on the menu selection. Any command defined in **input.conf** can be added to the contextmenu. If more complex menus are required then it's possible to use [json-ipc](https://mpv.io/manual/master/#json-ipc) as an alternative.
##  ▶️  &nbsp; delete-file.lua
Deletes the currently playing video file.
#### Installation
1. Copy [delete-file.lua](delete-file.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**
```
Ctrl+DEL script_message delete-file
```
#### Usage
Activating this command will delete the currently playing video file and also remove it from the playlist.

## ▶️  &nbsp; move-file.lua
Moves the currently playing video file to a specified folder.
#### Installation
1. Copy [move-file.lua](move-file.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**
```
Ctrl+1 script_message move-file "C:\\Folder1"
```
3. Edit ```"C:\\Folder1"``` as needed (double slashes are required).
#### Usage
Activating this command will move the currently playing video file to the specified folder (if the folder doesn't exist then it will be created). It will also remove the file from the playlist. 

## ▶️  &nbsp; move-file-datetime.lua
Moves the currently playing video file to a timestamped subfolder.
#### Installation
1. Copy [move-file-datetime.lua](move-file-datetime.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**
```
Ctrl+2 script_message move-file-datetime
```
#### Usage
Activating this command will move the currently playing video file a timestamped subfolder e.g. ```.\20200425203645\video.mkv```. The timestamp remains until mpv is closed. The playlist entry is also removed for the video file.

## ▶️  &nbsp; move-file-subfolder.lua
Moves the currently playing video file to a specified subfolder.
#### Installation
1. Copy [move-file-subfolder.lua](move-file-subfolder.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**
```
Ctrl+3 script_message move-file-subfolder "Subfolder1"
```
3. Edit ```"Subfolder1"``` as needed (no slashes).
#### Usage
Activating this command will move the currently playing video file to the specified subfolder e.g ```.\Subfolder1\video.mkv```. The playlist entry is also removed for the video file.

## ▶️  &nbsp; cut-video.lua
Uses ffmpeg to cut sections of the currently playing video. The file format remains the same; no encoding is done to the video.
#### Installation
1. Copy [cut-video.lua](cut-video.lua) to your mpv scripts directory.
2. [ffmpeg](https://www.ffmpeg.org/download.html) must either be added to your mpv installation folder or added to your Windows Environment Variables (Path) so that it can be located by the script.
3. Add the following text to **input.conf**
```
Ctrl+LEFT script_message cut-left
Ctrl+RIGHT script_message cut-right
Ctrl+ENTER script_message cut-finish
```
#### Usage
```Ctrl+LEFT``` to set the start position, ```Ctrl+RIGHT``` to set the end position, and press ```Ctrl+ENTER``` to begin cutting that section of video to a new file. The new file is placed in the same directory as the original file.
## ▶️  &nbsp; load-dir.lua
Adds all video files from the current directory to the active playlist.
#### Installation
1. Copy [load-dir.lua](load-dir.lua) to your mpv scripts directory.
2. Add the following command to **input.conf**
```
Alt+l script_message load-dir
```
#### Usage
Activating this command will retreive all video files from the directory of the currently playing video file and add them to the active playlist.

## ▶️  &nbsp; load-dir-auto.lua
Automatically adds all video files from the current directory to the active playlist.
#### Installation
1. Copy [load-dir-auto.lua](load-dir-auto.lua) to your mpv scripts directory.
#### Usage
No action required; loading happens automatically after playback begins. 

## ▶️  &nbsp; clean-playlist.lua
Removes all entries from the current playlist that are not video files.
#### Installation
1. Copy [clean-playlist.lua](clean-playlist.lua) to your mpv scripts directory.
2. Add the following command to **input.conf**
```
Alt+c script_message clean-playlist
```
#### Usage
Activating this command will remove all entires from the current playlist that are not video files. This is useful when the playlist has unwanted file types (images, music, etc).

## Notes
* Scripts have only been tested on Windows 10
## Installing Files
Any one of the following locations will work for installing **scripts**.
* \<install directory\>\scripts\anyscript.lua
* \<install directory\>\portable_config\scripts\anyscript.lua
  
Any one of the following locations will work for installing **config files** (input.conf, mpv.conf).
* \<install directory\>\input.config
* \<install directory\>\portable_config\input.config
