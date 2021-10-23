-- /components/bars/full_v1.lua

-- Clock and calendar widget
local clock = wibox.widget.textclock('<span foreground="#fff">   %b %d | %I:%M %p   </span>')

-- Calendar
local calendar_widget = require("../ext/awesome-wm-widgets/calendar-widget/calendar")
local cw = calendar_widget()
local cw = calendar_widget({
    theme = "dark",
    placement = "top_center",
    radius = 8
})

clock:connect_signal("button::press",  function(_, _, _, button)
    if button == 1 then cw.toggle() end
end)

-- CPU
local cpu_widget = require("../ext/awesome-wm-widgets/cpu-widget/cpu-widget")
local cpuTask = cpu_widget({
    width = 70,
    step_width = 2,
    step_spacing = 0,
    color = "#434c5e"
})

-- RAM
local ram_widget = require("../ext/awesome-wm-widgets/ram-widget/ram-widget")
local ramTask = ram_widget({
    color_used = "#888",
    color_free = "#aa000000"
})

-- Net Speed
local net_speed_widget = require("../ext/awesome-wm-widgets/net-speed-widget/net-speed")
local netTask = net_speed_widget()

-- Volume
local volume_widget = require("../ext/awesome-wm-widgets/volume-widget/volume")
local volumeTask = volume_widget({
    widget_type = "icon_and_text"
})

-- Main menu
awmenu = {
    { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "Restart", awesome.restart },
    { "Quit", function() awesome.quit() end },
}

-- Context menu
maincontextmenu = awful.menu({
    items = {
        { "Menu", awmenu },
        { "Terminal", user.programs.terminal }
    }
})

-- Home button
launcher = awful.widget.launcher({
    menu = maincontextmenu,
})

awful.screen.connect_for_each_screen(function(s)
    local w = {}
    for i = 1, user.style.windowCount do
        for k, v in pairs(user.style.windowNames) do
            if i == v then
                w[#w+1] = k
            else
                w[#w+1] = i
            end    
        end        
    end
    
    -- add tags
    awful.tag(w, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    -- no fucking idea what this is
    s.promptbox = awful.widget.prompt()
    
    -- the button which indicates what layout we're using
    s.layoutbox = awful.widget.layoutbox(s)
    s.layoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)
    ))
    
    -- the 1-9 buttons
    s.tagslist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,

        widget_template = {
            {
                {
                    {
                        {
                            {
                                id = "index_role",
                                widget = wibox.widget.textbox,
                            },

                            margins = 4,
                            widget = wibox.container.margin,
                        },

                        bg = "#888",
                        shape = gears.shape.circle,
                        widget = wibox.container.background,
                    },
                    
                    layout = wibox.layout.fixed.horizontal,
                },

                left = 6,
                right = 6,
                widget = wibox.container.margin
            },

            id = "background_role",
            widget = wibox.container.background,
            create_callback = function(self, c3, index, objects)
                self:get_children_by_id("index_role")[1].markup = "<b></b>"

                self:connect_signal("mouse::enter", function()
                    if self.bg ~= "#FFFFFF" then
                        self.backup = self.bg
                        self.has_backup = true
                    end

                    self.bg = "#FFFFFF"
                end)

                self:connect_signal("mouse::leave", function()
                    if self.has_backup then self.bg = self.backup end
                end)
            end,
        },

        buttons = gears.table.join(
            awful.button({}, 1, function(t)
                t:view_only()
            end),
        
            awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
        
            awful.button({ modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
        
            awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
            awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
        )
    }

    -- the program names
    s.tasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = gears.table.join(
            awful.button({}, 1, function(c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal(
                        "request::activate",
                        "tasklist",
                        { raise = true }
                    )
                end
            end),
            
            awful.button({}, 3, function()
                awful.menu.client_list({ theme = { width = 150 }})
            end), awful.button({}, 4, function()
                awful.client.focus.byidx(1)
            end), awful.button({}, 5, function ()
                awful.client.focus.byidx(-1)
            end)
        ),

        widget_template = {
            {
                wibox.widget.base.make_widget(),
                forced_height = 2,
                id = "background_role",
                widget = wibox.container.background,
            },

            {
                {
                    id = "clienticon",
                    widget = awful.widget.clienticon,
                },

                margins = 5,
                widget = wibox.container.margin
            },

            nil,
            create_callback = function(self, c, index, objects) self:get_children_by_id("clienticon")[1].client = c end,
            layout = wibox.layout.align.vertical,
        },
    }

    if user.style.widgets.taskbar then
        local options = {
            position = "top",
            screen = s,
            height = 25,
            bg = user.style.bar.color_bg,
            border_color = user.style.bar.border_bg,
            border_width = 0,
        }

        local systemtray = wibox.widget.systray()
        systemtray:set_base_size(15)

        s.wibox_Main = awful.wibar(options)        
        s.wibox_Main:setup {
            layout = wibox.layout.align.horizontal,
            expand = "none", -- Centered

            {
                layout = wibox.layout.fixed.horizontal,
                launcher,
                s.tagslist,
                s.promptbox,

                wibox.layout.margin(s.tasklist, 10, 10, 0, 0),
            },
            
            clock,

            {
                layout = wibox.layout.fixed.horizontal,

                wibox.layout.margin(volumeTask, 5, 5, 0, 0),
                wibox.layout.margin(cpuTask, 5, 5, 0, 0),
                netTask,
                wibox.layout.margin(wibox.widget.systray(), 20, 20, 4, 0),
                wibox.layout.margin(ramTask, 5, 5, 0, 0),
                wibox.layout.margin(s.layoutbox, 5, 5, 4, 4)
            },
        }

    end
end)

user.programs.autostartCustom()