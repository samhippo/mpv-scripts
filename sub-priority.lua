-- This scripts automatically selects the last english subtitle track that doesn't contain "sign" or "song"
-- If no subtitle exists that matches this criteria then the script does nothing and exits


function load_sub()
    local track_list = mp.get_property_native('track-list')
    for i = 1, #track_list do
        local title = ""
        if track_list[i].title then 
            title = track_list[i].title:lower() 
        end
        if track_list[i].type == "sub" and track_list[i].lang == "eng" and not string.match(title,"sign")  and not string.match(title,"song") then
            mp.set_property("sid", track_list[i].id)
        end
    end
end
mp.register_event("file-loaded", load_sub)
