local function main()
    local playlist = mp.get_property_native('playlist')
    local skipCurrent = false
    for i = #playlist, 1, -1 do
        local ext = string.match(playlist[i].filename, "%.([^.]+)$")
        if(ext ~= nil) then
            ext = ext:lower()
            if(     ext ~= "mkv" 
                and ext ~= "mp4" 
                and ext ~= "webm"
                and ext ~= "wmv"
                and ext ~= "avi" 
                and ext ~= "mpg" 
                and ext ~= "mpeg"
                and ext ~= "mov" 
                and ext ~= "vob" 
                and ext ~= "ts" 
                and ext ~= "m2ts" 
                and ext ~= "divx"
                and ext ~= "flv"
                and ext ~= "asf"
                and ext ~= "m4v"
                and ext ~= "h264"
                and ext ~= "rmvb"
                and ext ~= "ogm") then
                    if(playlist[i].current) then
                        skipCurrent = true
                    else
                        mp.commandv('playlist-remove',i-1)     
                    end
            end
        end
    end
    if(skipCurrent) then
        mp.commandv('playlist-remove','current')
    end
end

mp.register_script_message("clean-playlist", main)