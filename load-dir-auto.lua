local utils = require "mp.utils"


local ext = { 
    "mkv","mp4","webm","wmv","avi","3gp","ogv","mpg","mpeg","mov","vob" ,"ts","m2ts","divx","flv","asf","m4v","h264","h265","rmvb","rm","ogm"
    ,"jpg","jpeg","bmp","gif","png","svg","tif","tiff"
    ,"mp3","flac","ape","ogg","wav","wma","opus","tta","m4a","alac"
}

local valid = {}
for i = 1, #ext do
    valid[ext[i]] = true
end


local function isNew(filename)
    local playlist = mp.get_property_native('playlist')
    for i = 1, #playlist do
        if (playlist[i].filename == filename) then
            return false
        end
    end
    return true
end

local function main()
    local dir, f = utils.split_path(mp.get_property("path"))
    local ar = utils.readdir(dir,"files")
    if(ar == nil) then return end
    for i, name in ipairs(ar) do
        local ext = string.match(name, "%.([^.]+)$")
        if(ext == nil) then ext = '' end
        ext = string.lower(ext)
        local filename = utils.join_path(dir, name)
        if(valid[ext] and isNew(filename)) then
            mp.commandv('loadfile',filename,'append')
        end
    end
end

mp.register_event("file-loaded",main)
