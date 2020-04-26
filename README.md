
# mpv-scripts
## delete-file.lua
This script deletes the currently playing video file.
### Installation
1. Copy [delete-file.lua](delete-file.lua) to your mpv scripts directory.
2. Add the following line to **input.conf** or replace the command if it already exists.
```
DEL script_message delete-file
```
### Usage
Press the Delete key when playing a video file. The file will be deleted and removed from the playlist. If no playlist is active then default behavior is for mpv to exit.
**Notes**
* Tested with Windows 10 only
* Works with Unicode Characters
* Works with relative paths (files inside sub folders)

## move-file.lua
This script moves the currently playing video file.
### Installation
1. Copy [move-file.lua](move-file.lua) to your mpv scripts directory.
2. Add the following line to **input.conf** or replace the command if it already exists. *"C:\\Folder1"* is the destination folder.
```
Ctrl+1 script_message move-file "C:\\Folder1"
```
### Usage
Press ```Ctrl+1``` when playing a video file. The file will be moved to the specified folder (if the folder doesn't exist it will be created) and removed from the playlist. If no playlist is active then the default behavior is for mpv to exit.
**Notes**
* Tested with Windows 10 only
* Works with Unicode Characters
* Works with relative paths (files inside sub folders)
