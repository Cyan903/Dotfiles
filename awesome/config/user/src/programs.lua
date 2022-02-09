-- /user/src/programs.lua

local programs = {
    terminal = "kitty",
    editor = "code",
    
    startup = {
        default = {
            -- I have 2 monitors, but you would usually configure xrandr to your setup.
            "xrandr --output DVI-D-0 --mode 1920x1080 --rate 120 --primary",
            "nitrogen --restore",
            "picom", "blueman-applet",
            "nm-applet", "start-pulseaudio-x11",
            "lxsession"
        },
    
        custom = {
            -- id, command, floating
            -- { "Firefox", "firefox", true }
        }
    }
}

programs.autostart = function()
    for _, program in ipairs(programs.startup.default) do
        awful.spawn.with_shell(program)
    end
end

programs.editorStart = string.format(
    "%s -e %s", programs.terminal, programs.editor
)

programs.autostartCustom = function()
    for _, program in pairs(programs.startup.custom) do

        awful.spawn(program[2], {
            floating = program[3],
            tag = program[1],
            placement = awful.placement.centered,
        })
    end
end

return programs