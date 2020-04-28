local dragging = false
local prevX = 0

function leftClick()
    mouseEvent("leftClick")
end

function leftDoubleClick()
    mouseEvent("leftDoubleClick")
end

function dragSeek(kevent)
    if(kevent["event"] == "down") then
        local x, y = mp.get_mouse_pos()
        prevX = x
        dragging = true
    else
        dragging = false
    end
end

function mouseEvent(event)
	local x, y = mp.get_mouse_pos()
	local window_width = mp.get_property("osd-width")
	local window_height = mp.get_property("osd-height")
	local bottomArea = window_height * .8
	local leftArea = window_width * .2
	local rightArea = window_width * .8
	local seek_perc = (x / window_width) * 100

	if(y > bottomArea) then
		mp.commandv('osd-msg-bar','seek',seek_perc, 'absolute-percent')
	elseif(x < leftArea and y < bottomArea) then
		mp.commandv('playlist-prev')
	elseif(x > rightArea and y < bottomArea) then
		mp.commandv('playlist-next')
    else
         if(event == "leftClick") then
            mp.commandv('cycle','pause')
         elseif(event == "leftDoubleClick") then
            mp.commandv('cycle','fullscreen')
         end
	end
end

function mouseMove()
	local x, y = mp.get_mouse_pos()
	local width = mp.get_property("osd-width")
	local height = mp.get_property("osd-height")
	local seekArea = height * .8
	if(y > seekArea) then
		mp.commandv('osd-msg-bar','show-progress')
    end
    
    if(dragging == true) then
        local x, y = mp.get_mouse_pos()
        local diff = (prevX - x) * .5;
        mp.commandv('osd-msg-bar','seek',diff)
        prevX = x
    end
end

mp.add_forced_key_binding("MBTN_RIGHT", "dragSeek", dragSeek, { repeatable = false; complex = true })
mp.register_script_message("custom-osc-left-click", leftClick)
mp.register_script_message("custom-osc-left-double-click", leftDoubleClick)
mp.register_script_message("custom-osc-mouse-move", mouseMove)

