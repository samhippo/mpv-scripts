
# mpv-scripts
##  ▶️  &nbsp; delete-file.lua
Deletes the currently playing video file.
#### Installation
1. Copy [delete-file.lua](delete-file.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**:
```
DEL script_message delete-file
```
#### Usage
Press the Delete key while playing a video file. The file will be deleted and removed from the playlist. If no playlist is active then default behavior is for mpv to exit.
* Tested with Windows 10 only
* Works with Unicode characters
* Works with relative paths (files inside sub folders)

## ▶️  &nbsp; move-file.lua
Moves the currently playing video file to a specified folder.
#### Installation
1. Copy [move-file.lua](move-file.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**:
```
Ctrl+1 script_message move-file "C:\\Folder1"
```
3. Edit *"C:\\\Folder1"* as needed.
#### Usage
Press ```Ctrl+1``` while playing a video file. The file will be moved to the specified folder (if the folder doesn't exist then it will be created). It will also remove the file from the active playlist. If no playlist is active then the default behavior is for mpv to exit.
* Tested with Windows 10 only
* Works with Unicode characters
* Works with relative paths (files inside sub folders)  
## ▶️  &nbsp; move-file-datetime.lua
Moves the currently playing video file to a timestamped subfolder.
#### Installation
1. Copy [move-file-datetime.lua](move-file-datetime.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**.
```
Ctrl+2 script_message move-file-datetime
```
#### Usage
Press ```Ctrl+2``` while playing a video file. The file will be moved to a timestamped subfolder e.g. *.\20200425203645\video.mkv*. The timestamp remains until mpv is closed and reopened. If no other items exist in the playlist then mpv auto closes by default.
## ▶️  &nbsp; move-file-subfolder.lua
Moves the currently playing video file to a specified subfolder.
#### Installation
1. Copy [move-file-subfolder.lua](move-file-subfolder.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**:
```
Ctrl+3 script_message move-file-subfolder "Subfolder1"
```
3. Edit *"Subfolder1"* as needed.
#### Usage
Press ```Ctrl+3``` while playing a video file. The file will be moved to the subfolder (*.\Subfolder1\video.mkv*). If no other items exist in the playlist then mpv auto closes by default.

