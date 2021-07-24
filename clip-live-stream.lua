-- trys to clip the last N seconds of a live stream/video using dump-cache
-- takes two parameters: the output folder and number of seconds
-- NOTE: it will create two files: .ts and .mkv. This is to ensure a compatible format is chosen.

local ov = mp.create_osd_overlay("ass-events")

function main(folder, seconds)
    local start_time = mp.get_property_native("time-pos")-seconds
    if start_time < 0 then start_time = 0 end
    local end_time = mp.get_property("time-pos")
    local filename = mp.get_property("media-title").." ".."["..math.floor(start_time).."-"..math.floor(end_time).."]"
    local clean_filename = string.gsub(filename, "[/\\:%*%?\"|]", "_")
    mp.commandv("dump-cache", start_time, end_time, folder..clean_filename..".ts")
    mp.commandv("dump-cache", start_time, end_time, folder..clean_filename..".mkv")
    ov.data = "{\\an4}{\\b1}{\\fs18}{\\1c&H00FFFF&}".."Saving Clip".."\n{\\an4}{\\b1}{\\fs18}{\\1c&H00FFFF&}"..folder..clean_filename
    ov:update()
    mp.add_timeout(5.0, function() ov:remove() end)
end
    
mp.register_script_message('clip-live-stream', main)