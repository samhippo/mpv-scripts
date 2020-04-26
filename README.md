
# mpv-scripts
##  ▶️  &nbsp; delete-file.lua
Deletes the currently playing video file.
#### Installation
1. Copy [delete-file.lua](delete-file.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**
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
2. Add the following line to **input.conf**
```
Ctrl+1 script_message move-file "C:\\Folder1"
```
3. Edit ```"C:\\\Folder1"``` as needed.
#### Usage
Press ```Ctrl+1``` while playing a video file. The file will be moved to the specified folder (if the folder doesn't exist then it will be created). It will also remove the file from the active playlist. If no playlist is active then the default behavior is for mpv to exit.
* Tested with Windows 10 only
* Works with Unicode characters
* Works with relative paths (files inside sub folders)  
## ▶️  &nbsp; move-file-datetime.lua
Moves the currently playing video file to a timestamped subfolder.
#### Installation
1. Copy [move-file-datetime.lua](move-file-datetime.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**
```
Ctrl+2 script_message move-file-datetime
```
#### Usage
Press ```Ctrl+2``` while playing a video file. The file will be moved to a timestamped subfolder (*.\20200425203645\video.mkv*). The timestamp remains until mpv is closed and reopened. If no other items exist in the playlist then mpv auto closes by default.
## ▶️  &nbsp; move-file-subfolder.lua
Moves the currently playing video file to a specified subfolder.
#### Installation
1. Copy [move-file-subfolder.lua](move-file-subfolder.lua) to your mpv scripts directory.
2. Add the following line to **input.conf**
```
Ctrl+3 script_message move-file-subfolder "Subfolder1"
```
3. Edit ```"Subfolder1"``` as needed.
#### Usage
Press ```Ctrl+3``` while playing a video file. The file will be moved to the subfolder (*.\Subfolder1\video.mkv*). If no other items exist in the playlist then mpv auto closes by default.
## ▶️  &nbsp; cut-video.lua
Uses ffmpeg to cut sections of the currently playing video. The file formats remain the same; no encoding is done to the video.
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
