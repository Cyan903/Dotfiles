-- /user/src/styles.lua

return {
    MainIcon = "/home/micah/.config/awesome/resources/manjaro.ico",
    ScriptsFolder = "/home/micah/Dev/Scripts",
    windowCount = 6,
    background = "#ffffff",
    titlebar = false,
    theme = "cyanpiano/theme.lua",
    
    windowNames = {
        D = 6
    },

    multipleMonitors = true,
    screenOrder = {
        2, 1
    },

    widgets = {
        taskbar = true,
        naughty = false,
        dmenu = true,
        rofi = true,
        pcmanfm = true
    },

    border = {
        color = "#000000a3",
        colorFocus = "#d1d1d1",
        width = 4,
    }
}