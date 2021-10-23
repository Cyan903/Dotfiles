-- /awesome/rules.lua

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.left,
    awful.layout.suit.max

    -- Defaults
        -- awful.layout.suit.floating,
        -- awful.layout.suit.tile,
        -- awful.layout.suit.tile.left,
        -- awful.layout.suit.tile.bottom,
        -- awful.layout.suit.tile.top,
        -- awful.layout.suit.fair,
        -- awful.layout.suit.fair.horizontal,
        -- awful.layout.suit.spiral,
        -- awful.layout.suit.spiral.dwindle,
        -- awful.layout.suit.max,
        -- awful.layout.suit.max.fullscreen,
        -- awful.layout.suit.magnifier,
        -- awful.layout.suit.corner.nw
}

awful.rules.rules = {
    {
        rule = {},
        properties = {
            border_width = user.style.border.width,
            border_color = user.style.border.color,
            focus = awful.client.focus.filter,
            raise = true,
            keys = user.shortcuts.clientkeys,
            buttons = user.shortcuts.clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },

    -- Floating clients
    {
        rule_any = {
            instance = {
                "nitrogen",
                "lutris"
            },
            
            class = {
                "Blueman-manager",
                "Tor Browser",
            },

            name = { "Event Tester" },
            role = { "pop-up" }
    }, properties = { floating = true }},

    {
        rule_any = {
            type = { "normal", "dialog" }
        }, properties = { titlebars_enabled = user.style.titlebar }
    },

    {
        rule = { instance = "plank" },
        properties = {
            border_width = false,
            ontop = true
        }
    },
}