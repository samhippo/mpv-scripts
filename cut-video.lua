local start_time_formated = nil
local start_time_seconds = nil
local end_time_seconds = nil
local end_time_formated = nil
local utils = require "mp.utils"
local ov = mp.create_osd_overlay("ass-events")
local ov2 = mp.create_osd_overlay("ass-events")


function fn_cut_finish()
  if(start_time_seconds == nil or end_time_seconds == nil) then
    mp.osd_message("time not set")
  else
    local output_directory, _ = utils.split_path(mp.get_property("path"))
  	local output_fname = mp.get_property("filename/no-ext").."_"..string.gsub(start_time_formated,":",".").."-"..string.gsub(end_time_formated,":",".").."."..mp.get_property("filename"):match("[^.]+$")
  	local output = utils.join_path(output_directory, output_fname)
    mp.commandv("run","ffmpeg","-ss",start_time_formated,"-i",mp.get_property("path"),"-to",tostring(end_time_seconds-start_time_seconds),"-c","copy",output)  
    start_time_formated = nil
    start_time_seconds = nil
    end_time_seconds = nil
    end_time_formated = nil
    ov:remove()
    ov2:remove()
  end
end

function fn_cut_left()
  start_time_formated = mp.command_native({"expand-text","${time-pos}"})
  start_time_seconds = mp.get_property_number("time-pos")
  local window_height = mp.get_property("osd-height")
  local pos = window_height * .3
  ov.data = "{\\pos(10,"..tostring(pos)..")}{\\b1}{\\fs22}{\\1c&H00FFFF&}".."Start Time: "..start_time_formated
  ov:update()
end

function fn_cut_right()
  end_time_seconds = mp.get_property_number("time-pos")
  end_time_formated = mp.command_native({"expand-text","${time-pos}"})
  local window_height = mp.get_property("osd-height")
  local pos = window_height * .34
  ov2.data = "{\\pos(10,"..tostring(pos)..")}{\\b1}{\\fs22}{\\1c&H00FFFF&}".."End Time: "..end_time_formated
  ov2:update()
end

mp.register_script_message('cut-left', fn_cut_left)
mp.register_script_message('cut-right', fn_cut_right)
mp.register_script_message('cut-finish', fn_cut_finish)