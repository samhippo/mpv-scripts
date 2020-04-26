local utils = require "mp.utils"
local datetime = nil
function main()
    local thisFolder, _ = utils.split_path(string.gsub(mp.get_property("path"), "/", "\\"))
    if (datetime == nil) then
        datetime = os.date("%Y%m%d%H%M%S")
    end
    local destFolder = utils.join_path(thisFolder, datetime)
    local fileToMove = string.gsub(mp.get_property("path"), "/", "\\")
    mp.commandv('run','cmd.exe', '/C', 'md', destFolder ,'&','move', fileToMove, destFolder)
    mp.commandv('playlist-remove','current')
end
mp.register_script_message("move-file-datetime", main)
