local utils = require "mp.utils"
function main()
	local fileToDelete = string.gsub(mp.get_property("path"), "/", "\\")
	local args = {'cmd.exe', '/C', 'del', fileToDelete}
	utils.subprocess({args = args, playback_only = false})
	mp.commandv('playlist-remove','current')
end
mp.register_script_message("delete-file", main)
