local v = require("config.variables")

hl.config({
    general = { -- https://wiki.hypr.land/configuring/core/config-options/#general
        gaps_in = 2,
        gaps_out = 3,
        border_size = v.WINDOW_BORDERS and 2 or 0,
        col = {
            active_border = v.color_primary,
            inactive_border = v.color_tertiary,
        },
        layout = "dwindle", -- master|dwindle
        snap = { -- https://wiki.hypr.land/configuring/core/config-options/#snap
            enabled = true,
        },
    },

    decoration = { -- https://wiki.hypr.land/configuring/core/config-options/#decoration
        active_opacity   = v.WINDOW_TRANSPARENCY and 0.97 or 1.0,
        inactive_opacity = v.WINDOW_TRANSPARENCY and 0.9 or 1.0,

        rounding = 6,
        blur = {
            size = 5,
            passes = 2, -- more passes = more resource intensive
            xray = true,
            noise = 0.1,
        },
        shadow = { -- https://wiki.hypr.land/configuring/core/config-options/#shadow
            enabled = false,
        }
    },

    plugin = {
        hyprbars = { -- https://github.com/hyprwm/hyprland-plugins/tree/main/hyprbars
            enabled = v.WINDOW_TITLE_BARS,
            bar_color = v.color_secondary,
            bar_height = 20,
            bar_padding = 11,
            bar_blur = true,

            bar_title_enabled = true,
            bar_text_size = 12,
            bar_text_font = "sans",
            bar_text_align = "left",
            bar_buttons_alignment = "right",
            col = {
                text = v.color_bg_primary,
            },

            bar_part_of_window = true,
            bar_precedence_over_border = true,

            icon_on_hover = false,
            inactive_button_color = "rgb(f74040)",
        }
    }
})

if v.WINDOW_TITLE_BARS then
    hl.plugin.hyprbars.add_button({
        bg_color = "rgb(f74040)",
        fg_color = "rgb(000000)",
        size = 13,
        icon = "󰖭", -- \u{F5AD}
        action = "hyprctl dispatch 'hl.dsp.window.close()'",
    })
end

