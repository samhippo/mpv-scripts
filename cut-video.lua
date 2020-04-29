local start_time_formated = nil
local start_time_seconds = nil
local end_time_seconds = nil
local end_time_formated = nil
local utils = require "mp.utils"
local ov = mp.create_osd_overlay("ass-events")

function fn_cut_finish(output_format)
  if(start_time_seconds == nil or end_time_seconds == nil) then
    mp.osd_message("time not set")
  else
    local output_directory, _ = utils.split_path(mp.get_property("path"))
    local output_ext = mp.get_property("filename"):match("[^.]+$")
    if(output_format ~= nil and output_format ~= output_ext) then
      local output_fname = mp.get_property("filename/no-ext").."_"..string.gsub(start_time_formated,":",".").."-"..string.gsub(end_time_formated,":",".").."."..output_format
      local output = utils.join_path(output_directory, output_fname)
      mp.msg.info("ffmpeg -ss "..start_time_seconds.." -i "..mp.get_property("path").." -to "..tostring(end_time_seconds-start_time_seconds).." "..output)
      mp.commandv("run","ffmpeg","-ss",start_time_seconds,"-i",mp.get_property("path"),"-to",tostring(end_time_seconds-start_time_seconds),output)
    else
      local output_fname = mp.get_property("filename/no-ext").."_"..string.gsub(start_time_formated,":",".").."-"..string.gsub(end_time_formated,":",".").."."..output_ext
      local output = utils.join_path(output_directory, output_fname)
      mp.msg.info("ffmpeg -ss "..start_time_seconds.." -i "..mp.get_property("path").." -to "..tostring(end_time_seconds-start_time_seconds).." -c copy "..output)
      mp.commandv("run","ffmpeg","-ss",start_time_seconds,"-i",mp.get_property("path"),"-to",tostring(end_time_seconds-start_time_seconds),"-c","copy",output) 
    end
    start_time_formated = nil
    start_time_seconds = nil
    end_time_seconds = nil
    end_time_formated = nil
    ov:remove()
  end
end

function fn_cut_left()
  start_time_seconds = mp.get_property_number("time-pos")
  start_time_formated = mp.command_native({"expand-text","${time-pos}"})
  mp.msg.info("START TIME: "..start_time_seconds)
  local screenText = "{\\an4}{\\b1}{\\fs14}{\\1c&H00FFFF&}".."Start Time: "..start_time_formated
  if(end_time_formated ~= nil) then
    screenText = "{\\an4}{\\b1}{\\fs14}{\\1c&H00FFFF&}".."End Time: "..end_time_formated.."\n"..screenText
  end
  ov.data = screenText
  ov:update()
end

function fn_cut_right()
  end_time_seconds = mp.get_property_number("time-pos")
  end_time_formated = mp.command_native({"expand-text","${time-pos}"})
  mp.msg.info("END TIME: "..end_time_seconds)
  local screenText = "{\\an4}{\\b1}{\\fs14}{\\1c&H00FFFF&}".."End Time: "..end_time_formated
  if(start_time_formated ~= nil) then
    screenText = screenText.."\n{\\an4}{\\b1}{\\fs14}{\\1c&H00FFFF&}".."Start Time: "..start_time_formated
  end
  ov.data = screenText
  ov:update()
end

mp.register_script_message('cut-left', fn_cut_left)
mp.register_script_message('cut-right', fn_cut_right)
mp.register_script_message('cut-finish', fn_cut_finish)
