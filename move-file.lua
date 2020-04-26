function main(destFolder)
    local fileToMove = string.gsub(mp.get_property("path"), "/", "\\")
    mp.commandv('run','cmd.exe', '/C', 'move', fileToMove, destFolder)
	mp.commandv('playlist-remove','current')
end
mp.register_script_message("move-file", main)
