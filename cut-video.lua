local start_time_formated = nil
local start_time_seconds = nil
local end_time_seconds = nil
local end_time_formated = nil
local utils = require "mp.utils"
local ov = mp.create_osd_overlay("ass-events")

function fn_cut_finish(p1,p2)
  if(start_time_seconds == nil or end_time_seconds == nil) then
    mp.osd_message("time not set")
  else
    local video_args = '-c copy'
    local output_format =  mp.get_property("filename"):match("[^.]+$")
    if((p1 == nil and p2 == nil) or (p1 == '' and p2 == '')) then
    else
      if(p1 == nil or p1 == '') then
      else
        output_format = p1
      end
      if(p2 == nil or p2 == '') then
        video_args = ''
      else
        video_args = p2
      end
    end
    local output_directory, _ = utils.split_path(mp.get_property("path"))
    local output_filename = mp.get_property("filename/no-ext").."_"..string.gsub(start_time_formated,":",".").."-"..string.gsub(end_time_formated,":",".").."."..output_format
    local output_path = utils.join_path(output_directory, output_filename)
    local args = {'ffmpeg', '-ss', tostring(start_time_seconds), "-i",tostring(mp.get_property("path")),"-to",tostring(end_time_seconds-start_time_seconds)}
    for token in string.gmatch(video_args, "[^%s]+") do
      mp.msg.fatal(token)
      table.insert(args,token)
    end
    table.insert(args,output_path)
    utils.subprocess_detached({args = args, playback_only = false})
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
