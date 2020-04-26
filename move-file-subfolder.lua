local utils = require "mp.utils"
function main(subfolder)
    local thisFolder, _ = utils.split_path(string.gsub(mp.get_property("path"), "/", "\\"))
    local destFolder = utils.join_path(thisFolder, subfolder)
    local fileToMove = string.gsub(mp.get_property("path"), "/", "\\")
    mp.commandv('run','cmd.exe', '/C', 'md', destFolder ,'&','move', fileToMove, destFolder)
    mp.commandv('playlist-remove','current')
end
mp.register_script_message("move-file-subfolder", main)
