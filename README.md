
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
Press the Delete key when playing a video file. The file will be deleted and removed from the active playlist. If no playlist exists then the default behavior is for mpv to exit.
### Notes
* Tested with Windows 10 only
* Works with Unicode Characters
* Works with relative paths (files inside sub folders)
