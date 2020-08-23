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

local first_run = true

local function sort(dt,asc)
    if(asc == nil or asc == "asc" or asc == "") then 
        table.sort(dt, function(a, b) return a.data < b.data end)
    else
        table.sort(dt, function(a, b) return a.data > b.data end)
    end
end

local function main()

    if(first_run) then
        first_run = false --this script only runs once

        if(mp.get_property_native("playlist/count") ~= 1) then
            return --if a playlist already exists then exit script
        end

        local sorted_index = -1
        local file_playing = mp.get_property("path")
        local dir, f = utils.split_path(mp.get_property("path"))
        local ar = utils.readdir(dir,"files")
        local dt = {}
        if(ar == nil) then return end
        for i, name in ipairs(ar) do
            local ext = string.match(name, "%.([^.]+)$")
            if(ext == nil) then ext = '' end
            ext = string.lower(ext)
            local ext_filename = utils.join_path(dir, name)
            if(valid[ext]) then
                table.insert(dt, {filename = ext_filename, data = ext_filename:lower()})
            end
        end
        mp.msg.info('auto-load-dir '..#dt..' files')
        sort(dt,"asc") -- simple alpha sort ascending order
        for i,n in ipairs(dt) do 
            if(n.filename ~= file_playing) then
                mp.commandv('loadfile',n.filename,'append')
            else
                sorted_index = i
            end
        end
        mp.commandv('playlist-move',mp.get_property_native("playlist-current-pos"),sorted_index)
   end
end

    mp.register_event("file-loaded",main)
