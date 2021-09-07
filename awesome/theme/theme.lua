-- /usr/src/programs.lua

-- CyanPiano AwesomeWM
-- Updated: 2021/09/07

local assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themePath = gfs.get_themes_dir().."cyanpiano/"
local taglistSquareSize = dpi(4)

local theme = {
    -- font + wallpaper
    wallpaper = themePath.."background.png",
    font = "monospace 8",

    -- background
    bg_normal = "#000000cc",
    bg_focus = "#333",
    bg_urgent = "#7d0000",
    bg_minimize = "#444444",
    bg_systray = "#000000cc",
    
    -- foreground
    fg_normal = "#eeeeee",
    fg_focus = "#ffffff",
    fg_urgent = "#ffffff",
    fg_minimize = "#ffffff",

    -- border
    useless_gap = dpi(0),
    border_width = dpi(1),
    border_normal = "#000000",
    border_focus = "#535d6c",
    border_marked = "#7d0000",

    -- images
    titlebar_close_button_normal = themePath.."titlebar/close_normal.png",
    titlebar_close_button_focus  = themePath.."titlebar/close_focus.png",
    titlebar_minimize_button_normal = themePath.."titlebar/minimize_normal.png",
    titlebar_minimize_button_focus  = themePath.."titlebar/minimize_focus.png",
    titlebar_ontop_button_normal_inactive = themePath.."titlebar/ontop_normal_inactive.png",
    titlebar_ontop_button_focus_inactive  = themePath.."titlebar/ontop_focus_inactive.png",
    titlebar_ontop_button_normal_active = themePath.."titlebar/ontop_normal_active.png",
    titlebar_ontop_button_focus_active  = themePath.."titlebar/ontop_focus_active.png",
    titlebar_sticky_button_normal_inactive = themePath.."titlebar/sticky_normal_inactive.png",
    titlebar_sticky_button_focus_inactive  = themePath.."titlebar/sticky_focus_inactive.png",
    titlebar_sticky_button_normal_active = themePath.."titlebar/sticky_normal_active.png",
    titlebar_sticky_button_focus_active  = themePath.."titlebar/sticky_focus_active.png",
    titlebar_floating_button_normal_inactive = themePath.."titlebar/floating_normal_inactive.png",
    titlebar_floating_button_focus_inactive  = themePath.."titlebar/floating_focus_inactive.png",
    titlebar_floating_button_normal_active = themePath.."titlebar/floating_normal_active.png",
    titlebar_floating_button_focus_active  = themePath.."titlebar/floating_focus_active.png",
    titlebar_maximized_button_normal_inactive = themePath.."titlebar/maximized_normal_inactive.png",
    titlebar_maximized_button_focus_inactive  = themePath.."titlebar/maximized_focus_inactive.png",
    titlebar_maximized_button_normal_active = themePath.."titlebar/maximized_normal_active.png",
    titlebar_maximized_button_focus_active  = themePath.."titlebar/maximized_focus_active.png",

    -- menu
    menu_submenu_icon = themePath.."submenu.png",
    menu_height = dpi(15),
    menu_width = dpi(100),

    -- layout
    layout_fairh = themePath.."layouts/fairhw.png",
    layout_fairv = themePath.."layouts/fairvw.png",
    layout_floating  = themePath.."layouts/floatingw.png",
    layout_magnifier = themePath.."layouts/magnifierw.png",
    layout_max = themePath.."layouts/maxw.png",
    layout_fullscreen = themePath.."layouts/fullscreenw.png",
    layout_tilebottom = themePath.."layouts/tilebottomw.png",
    layout_tileleft   = themePath.."layouts/tileleftw.png",
    layout_tile = themePath.."layouts/tilew.png",
    layout_tiletop = themePath.."layouts/tiletopw.png",
    layout_spiral  = themePath.."layouts/spiralw.png",
    layout_dwindle = themePath.."layouts/dwindlew.png",
    layout_cornernw = themePath.."layouts/cornernww.png",
    layout_cornerne = themePath.."layouts/cornernew.png",
    layout_cornersw = themePath.."layouts/cornersww.png",
    layout_cornerse = themePath.."layouts/cornersew.png"
}

-- taglist & icon
theme.taglist_squares_sel = assets.taglist_squares_sel(taglistSquareSize, theme.fg_normal)
theme.taglist_squares_unsel = assets.taglist_squares_unsel(taglistSquareSize, theme.fg_normal)
theme.awesome_icon = assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)
theme.icon_theme = nil

return theme