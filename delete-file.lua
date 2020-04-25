function main()
	local fileToDelete = string.gsub(mp.get_property("path"), "/", "\\")
	mp.commandv('run','cmd.exe', '/C', 'del', fileToDelete)
	mp.commandv('playlist-remove','current')
end
mp.register_script_message("delete-file", main)
