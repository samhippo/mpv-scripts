
# mpv-scripts
## 1️⃣  delete-file.lua
Deletes the currently playing video file.
### Installation
1. Copy [delete-file.lua](delete-file.lua) to your mpv scripts directory.
2. Add the following line to **input.conf** or replace the command if it already exists.
```
DEL script_message delete-file
```
### Usage
Press the Delete key when playing a video file. The file will be deleted and removed from the playlist. If no playlist is active then default behavior is for mpv to exit.
* Tested with Windows 10 only
* Works with Unicode characters
* Works with relative paths (files inside sub folders)

## move-file.lua
Moves the currently playing video file to a specified folder.
### Installation
1. Copy [move-file.lua](move-file.lua) to your mpv scripts directory.
2. Add the following line to **input.conf** or replace the command if it already exists. *"C:\\\Folder1"* is the destination folder.
```
Ctrl+1 script_message move-file "C:\\Folder1"
```
### Usage
Press ```Ctrl+1``` when playing a video file. The file will be moved to the specified folder (if the folder doesn't exist then it will be created). It will also remove the file from the active playlist. If no playlist is active then the default behavior is for mpv to exit.
* Tested with Windows 10 only
* Works with Unicode characters
* Works with relative paths (files inside sub folders)
