local utils = require "mp.utils"
local function isNew(filename)
    local playlist = mp.get_property_native('playlist')
    for i = 1, #playlist do
        if (playlist[i].filename == filename) then
            return false
        end
    end
    return true
end

local function isVideo(name)
    local ext = string.match(name, "%.([^.]+)$")
    if(ext == nil) then
        return false
    end
    ext = ext:lower()
    if(    ext == "mkv" 
        or ext == "mp4" 
        or ext == "webm"
        or ext == "wmv"
        or ext == "avi" 
        or ext == "mpg" 
        or ext == "mpeg"
        or ext == "mov" 
        or ext == "vob" 
        or ext == "ts" 
        or ext == "m2ts" 
        or ext == "divx"
        or ext == "flv"
        or ext == "asf"
        or ext == "m4v"
        or ext == "h264"
        or ext == "rmvb"
        or ext == "ogm") then
        return true
    else
        return false
    end
end

local function main()
    local dir, f = utils.split_path(mp.get_property("path"))
    local ar = utils.readdir(dir,"files")
    for i, name in ipairs(ar) do
        local filename = utils.join_path(dir, name)
        if(isVideo(name) and isNew(filename)) then
            mp.commandv('loadfile',filename,'append')
        end
    end
end

mp.register_script_message("load-dir", main)
