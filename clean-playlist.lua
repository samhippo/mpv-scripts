local ext = { 
    "mkv","mp4","webm","wmv","avi","3gp","ogv","mpg","mpeg","mov","vob" ,"ts","m2ts","divx","flv","asf","m4v","h264","h265","rmvb","rm","ogm"
}

local valid = {}
for i = 1, #ext do
    valid[ext[i]] = true
end

local function main()
    local playlist = mp.get_property_native('playlist')
    local skipCurrent = false
    for i = #playlist, 1, -1 do
        local ext = string.match(playlist[i].filename, "%.([^.]+)$")
        if(ext == nil) then ext = '' end
        ext = string.lower(ext)
        if(valid[ext]) then
            --do nothing
        else
            if(playlist[i].current) then
                skipCurrent = true
            else
                mp.commandv('playlist-remove',i-1)     
            end
        end
    end
    if(skipCurrent) then
        mp.commandv('playlist-remove','current')
    end
end

mp.register_script_message("clean-playlist", main)