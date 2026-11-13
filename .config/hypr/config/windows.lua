-- https://wiki.hypr.land/configuring/core/rules/window-rules/

local v = require("config.variables")

-- Set up primary tags
hl.window_rule({ match = { class = "vlc" },                                           tag = "+video" })
hl.window_rule({ match = { title = "^(TheLongDark|Valheim|W.o.T. Client)$" },         tag = "+game" })
hl.window_rule({ match = { class = "^steam_app_.*" },                                 tag = "+game" })
hl.window_rule({ match = { class = "gamescope" },                                     tag = "+game" })
hl.window_rule({ match = { class = "steam" },                                         tag = "-game" }) -- "Manage Game Settings" window is not a game
hl.window_rule({ match = { initial_title = "Godot" },                                 tag = "+game" })
hl.window_rule({ match = { initial_title = "RuneLite" },                              tag = "+osrs" })
hl.window_rule({ match = { initial_title = "Visual Studio Code" },                    tag = "+code" })
hl.window_rule({ match = { initial_title = "Mozilla Firefox" },                       tag = "+browser" })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" },                    tag = "+waybar_dropdown" })
hl.window_rule({ match = { class = "blueman-manager" },                               tag = "+waybar_dropdown" })
hl.window_rule({ match = { title = "^[pP]icture.in.[pP]icture$" },                    tag = "+popup" })
hl.window_rule({ match = { title = "^Save.File$" },                                   tag = "+popup" })
hl.window_rule({ match = { title = "^Open.File$" },                                   tag = "+popup" })
hl.window_rule({ match = { title = "^.* [lL]auncher$" },                              tag = "+popup" })
hl.window_rule({ match = { title = "^Calculator$" },                                  tag = "+popup" })
hl.window_rule({ match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$" }, tag = "+popup" })
hl.window_rule({ match = { title = "^Steam - Self Updater$" },                        tag = "+popup" })
hl.window_rule({ match = { title = "^Settings - .* - Obsidian .*$" },                 tag = "+popup" })
hl.window_rule({ match = { class = "^CachyOSHello$" },                                tag = "+popup" })
hl.window_rule({ match = { class = "^zenity$" },                                      tag = "+popup" })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" }, tag = "+popup" })
hl.window_rule({ match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$" }, tag = "+popup" })

-- Global window settings
hl.window_rule({
    name = "global-defaults",
    match = { title = "^.*?" },

    ["hyprbars:no_bar"] = true,
})

-- Apply game settings
hl.window_rule({
    name = "gaming-tweaks",
    match = { tag = "game" },

    content = "game",
    workspace = "name:" .. v.wks_gaming,
    opacity = "1 override",
})

-- Apply video settings
hl.window_rule({
    name = "video-tweaks",
    match = { tag = "video" },

    content = "video",
    opacity = "1 override",
})

-- Apply waybar-dropdown settings
hl.window_rule({
    name = "waybar-dropdown-tweaks",
    match = { tag = "waybar_dropdown" },

    size = { 800, 600 },
    move = { "monitor_w-822", "80" },
    animation = "slide down",
    tag = "+popup",
})

-- Apply pop-up settings
hl.window_rule({
    name = "popup-tweaks",
    match = { tag = "popup" },

    opacity = "1 override",
    float = true,
    ["hyprbars:no_bar"] = false,
})

-- ### Misc Tweaks ###
hl.window_rule({ match = { tag = "osrs"                  }, opacity = "1 override", border_size = 0 })
hl.window_rule({ match = { tag = "browser", focus = true }, opacity = "1 override" })
hl.window_rule({ match = { tag = "code",    focus = true }, opacity = "1 override" })

-- Sizing for Save-File Dialog
hl.window_rule({ match = { class = "firefox", title = "^.*(S|s)ave .* - .*" }, size = { 800, 600 } })

-- Disable duplicate titlebar for the calculator
hl.window_rule({
    match = { title = "^Calculator$" },

    ["hyprbars:no_bar"] = true,
})
