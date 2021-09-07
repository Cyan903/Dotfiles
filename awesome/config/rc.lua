-- /user/src/programs.lua

-- CyanPiano AwesomeWM
-- Updated: 2021/09/07

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
require("./components/taskbar")

user.shortcuts.init()
user.programs.autostart()