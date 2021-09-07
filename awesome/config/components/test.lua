
local w = wibox {
    visible = true,
    width = 100,
    height = 100,
    bg = "#ff0000",
    below = true,
}

w:setup {
    text = "foo",
    widget = wibox.widget.textbox
}


-- local cdir = awful.util.getdir("config")