-- /components/taskbardim.lua

if user.style.multipleMonitors then
    for s = 1, #user.style.screenOrder do
        local curscreen = user.style.screenOrder[s]
        local box = wibox {
            visible = true,
            height = 30,
            bg = "#000000a1",
            width = screen[curscreen].geometry.width
        }
        
        box:setup {
            text = "",
            widget = wibox.widget.textbox
        }

        awful.placement.top(box, { parent = screen[curscreen] })
    end
else
    wibox {
        visible = true,
        height = 30,
        bg = "#000000a1",
        width = screen[1].geometry.width   
    }:setup {
        text = "",
        widget = wibox.widget.textbox
    }
end