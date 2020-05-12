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

local function getFileList()
    local dir, f = utils.split_path(mp.get_property("path"))
    local ar = utils.readdir(dir,"files")
    local fileList = {}
    for i, name in ipairs(ar) do
        local ext = string.match(name, "%.([^.]+)$")
        if(ext == nil) then ext = '' end
        ext = string.lower(ext)
        if(valid[ext]) then
            table.insert(fileList,name)
        end
    end
    return fileList
end

local function main()
    local fileList = getFileList()
    for i = 1, #fileList do
        if(mp.get_property("filename") == fileList[i]) then
            local next = i + 1
            if(next > #fileList) then next = 1 end
            local dir, f = utils.split_path(mp.get_property("path"))
            mp.commandv('loadfile',utils.join_path(dir, fileList[next]),'replace')
            return
        end
    end
end
mp.register_script_message("next-file", main)