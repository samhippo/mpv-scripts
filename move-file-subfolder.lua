local utils = require "mp.utils"
function main(subfolder)
    local thisFolder, _ = utils.split_path(string.gsub(mp.get_property("path"), "/", "\\"))
    local destFolder = utils.join_path(thisFolder, subfolder)
    local fileToMove = string.gsub(mp.get_property("path"), "/", "\\")
    local args = {'cmd.exe', '/C', 'md', destFolder ,'&','move', fileToMove, destFolder}
	utils.subprocess({args = args, playback_only = false})
    mp.commandv('playlist-remove','current')
end
mp.register_script_message("move-file-subfolder", main)

