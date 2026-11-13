local v = require("config.variables")

hl.config({
    group = { -- https://wiki.hypr.land/configuring/core/config-options/#group
        col = {
            border_active = v.color_primary,
            border_inactive = v.color_tertiary,
            border_locked_active = v.color_primary,
            border_locked_inactive = v.color_tertiary,
        },
        groupbar = { -- https://wiki.hypr.land/configuring/core/config-options/#groupbar
            font_family = "Fira Sans",
            font_weight_active = "bold",
            font_weight_inactive = "semibold",
            font_size = 14,
            height = 30,
            gradients = false,
            indicator_height = 4,
            text_color = v.color_secondary,
            col = {
                active = v.color_primary,
                inactive = v.color_bg_primary,
                locked_active = v.color_bg_secondary,
                locked_inactive = v.color_bg_primary,
            },
        },
    },

    misc = { -- https://wiki.hypr.land/configuring/core/config-options/#misc
        disable_autoreload = true,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        enable_swallow = true,
        font_family = "Fira Sans",
        splash_font_family = "Fira Sans",
        col = {
            splash = v.color_primary,
        },
        background_color = v.color_bg_primary,
        swallow_regex = "^(nautilus|nemo|thunar|btrfs-assistant.)$",
        focus_on_activate = true,
        vrr = 3,
    },

    render = { -- https://wiki.hypr.land/configuring/core/config-options/#render
        cm_auto_hdr = 0,
        ctm_animation = 1,
        direct_scanout = 2,
        send_content_type = true,
    },

    dwindle = { -- https://wiki.hypr.land/configuring/layouts/dwindle-layout/
        special_scale_factor = 0.8,
        preserve_split = true,
    },

    master = { -- https://wiki.hypr.land/configuring/layouts/master-layout/
        new_status = "master",
        special_scale_factor = 0.8,
    },

    ecosystem = { -- https://wiki.hypr.land/configuring/core/config-options/#ecosystem
        no_donation_nag = true,
    },
})
