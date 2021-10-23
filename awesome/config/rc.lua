-- /user/src/programs.lua

-- CyanPiano AwesomeWM
-- Updated: 2021/10/22

pcall(require, "luarocks.loader")

gears = require("gears")
awful = require("awful")
wibox = require("wibox")
beautiful = require("beautiful")
menubar = require("menubar")
hotkeys_popup = require("awful.hotkeys_popup")

user = require("./user/user")
menubar.utils.terminal = user.programs.terminal
beautiful.init(gears.filesystem.get_themes_dir()..user.style.theme)

require("awful.hotkeys_popup.keys")
require("awful.autofocus")
require("./awesome/errors")
require("./awesome/rules")
require("./awesome/signals")

-- If bar has full in its name, load the dim.
if user.style.widgets.taskbar then
    if string.find(user.style.bar.version, "full") then
        require("components.taskbardim")
    end

    require("./components/bars/"..user.style.bar.version)
end

user.shortcuts.init()
user.programs.autostart()