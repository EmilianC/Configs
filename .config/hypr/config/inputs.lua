local v = require("config.variables")

hl.config({
    input = { -- https://wiki.hypr.land/configuring/core/config-options/#input
        -- MOUSE
        follow_mouse = 2, -- 0|1|2|3
        float_switch_override_focus = 2,
        accel_profile = "flat",
        sensitivity = -0.06,

        -- KB
        repeat_rate = 30,
        repeat_delay = 250,
        numlock_by_default = true,
    },

    cursor = { -- https://wiki.hypr.land/configuring/core/config-options/#cursor
        no_warps = true,
        default_monitor = v.monitor_main,
    },

    binds = { -- https://wiki.hypr.land/configuring/core/config-options/#binds
        workspace_back_and_forth = false,
        workspace_center_on = false,
        movefocus_cycles_fullscreen = true,
        window_direction_monitor_fallback = true,
        allow_workspace_cycles = false,
    },
})

-- https://wiki.hypr.land/configuring/core/binds/

-- ### Wallpapers ###
hl.bind(v.mainMod .. " + W",
    hl.dsp.exec_cmd(v.scripts_dir .. "/wallpaperctl.sh -s && matugen -m dark --source-color-index 0 image \"$(head -n 1 " .. v.scripts_dir .. "/.wallpaper_state)\" && " .. v.scripts_dir .. "/reload/all.sh && hyprctl reload config-only"),
    { description = "Select a new wallpaper" }
)

-- ### Power menu ###
hl.bind(v.mainMod .. " + P",
    hl.dsp.exec_cmd(v.scripts_dir .. "/power_menu.sh"),
    { description = "Open the Power Menu" }
)

-- ### Audio ###
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +" .. v.volume_step .. " && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{if($1>100) system(\"pactl set-sink-volume @DEFAULT_SINK@ 100%\")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > " .. v.volume_display_pipe),
    { repeating = true, locked = true }
)

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -" .. v.volume_step .. " && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > " .. v.volume_display_pipe),
    { repeating = true, locked = true }
)

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("amixer sset Master toggle | sed -En '/\\[on\\]/ s/.*\\[([0-9]+)%\\].*/\\1/ p; /\\[off\\]/ s/.*/0/p' | head -1 > " .. v.volume_display_pipe),
    { repeating = true, locked = true }
)

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggle play/pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { description = "Next track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { description = "Previous track" })

-- ### Workspaces ###
hl.bind(v.mainMod .. " + 1", hl.dsp.focus({ workspace = "name:" .. v.wks_main }))
hl.bind(v.mainMod .. " + 2", hl.dsp.focus({ workspace = "name:" .. v.wks_main2 }))
hl.bind(v.mainMod .. " + 3", hl.dsp.focus({ workspace = "name:" .. v.wks_gaming }))
hl.bind(v.mainMod .. " + 4", hl.dsp.focus({ workspace = "name:" .. v.wks_side }))
hl.bind(v.mainMod .. " + 5", hl.dsp.focus({ workspace = "name:" .. v.wks_tv }))

-- These don't work unless the main monitor is focused.
-- The logic will likely need to be forwarded to a bash script.
hl.bind(v.mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "m+1" }), { description = "Scroll right through workspaces" })
hl.bind(v.mainMod .. " + CTRL + left",  hl.dsp.focus({ workspace = "m-1" }), { description = "Scroll left through workspaces" })

-- ### Screenshots ###
hl.bind(v.mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(v.shot_region), { description = "Create a screenshot of an area" })
hl.bind(v.mainMod .. " + S",         hl.dsp.exec_cmd(v.shot_window), { description = "Create a screenshot of the active window" })
hl.bind("PRINT",                     hl.dsp.exec_cmd(v.shot_screen), { description = "Create a screenshot of the active display" })

-- ### Utilities ###
hl.bind(v.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true }) -- left click
hl.bind(v.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- right click

hl.bind(v.mainMod .. " + F",
    hl.dsp.exec_cmd("killall " .. v.taskbar_manager .. " || " .. v.taskbar_manager),
    { description = "Toggle task bar On/Off" }
)

hl.bind(v.mainMod .. " + N",
    hl.dsp.exec_cmd("killall " .. v.flux_manager .. " || " .. v.flux_manager),
    { description = "Toggle night-mode On/Off" }
)

hl.bind(v.mainMod .. " + R",
    hl.dsp.exec_cmd(v.scripts_dir .. "/reload/all.sh; hyprctl reload config-only"),
    { description = "Reload configs (minimal)" }
)

hl.bind(v.mainMod .. " + SHIFT + R",
    hl.dsp.exec_cmd(v.scripts_dir .. "/reload/all.sh; hyprctl reload"),
    { description = "Reload configs (full)" }
)

hl.bind(v.mainMod .. " + QUOTELEFT", hl.dsp.exec_cmd(v.terminal),            { description = "Open a new terminal window" })
hl.bind(v.mainMod .. " + SPACE",     hl.dsp.exec_cmd(v.applauncher),         { description = "Open the application launcher" })
hl.bind(v.mainMod .. " + E",         hl.dsp.exec_cmd(v.filemanager),         { description = "Open the file manager" })
hl.bind(v.mainMod .. " + Q",         hl.dsp.window.close(),                  { description = "Close (not kill) current window" })
hl.bind(v.mainMod .. " + O",         hl.dsp.exec_cmd("pavucontrol --tab=3"), { description = "Open audio output controls" })

-- ### Windows ###
-- Focusing
hl.bind(v.mainMod .. " + left",  hl.dsp.focus({ direction = "left" }),  { description = "Move focus to the left" })
hl.bind(v.mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus to the right" })
hl.bind(v.mainMod .. " + up",    hl.dsp.focus({ direction = "up" }),    { description = "Move focus upwards" })
hl.bind(v.mainMod .. " + down",  hl.dsp.focus({ direction = "down" }),  { description = "Move focus downwards" })
-- Movement
hl.bind(v.mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }),  { description = "Move active window to the left" })
hl.bind(v.mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }), { description = "Move active window to the right" })
hl.bind(v.mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }),    { description = "Move active window upwards" })
hl.bind(v.mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }),  { description = "Move active window downwards" })

-- ### Resizing ###
-- https://wiki.hypr.land/configuring/core/binds/submaps/
hl.bind(v.mainMod .. " + D", hl.dsp.submap("resize_window"), { description = "Activates window resizing mode" })
hl.define_submap("resize_window", function()
    hl.bind("left",   hl.dsp.window.resize({ x = -40, y =   0, relative = true }), { description = "Resize to the left" })
    hl.bind("right",  hl.dsp.window.resize({ x =  40, y =   0, relative = true }), { description = "Resize to the right" })
    hl.bind("up",     hl.dsp.window.resize({ x =   0, y = -40, relative = true }), { description = "Resize upwards" })
    hl.bind("down",   hl.dsp.window.resize({ x =   0, y =  40, relative = true }), { description = "Resize downwards" })
    hl.bind("escape", hl.dsp.submap("reset"),                                      { description = "Ends window resizing mode" })
end)

-- ### Gaps ###
hl.bind(v.mainMod .. " + SHIFT + G",
    hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"'),
    { description = "Restore default window gaps" }
)

hl.bind(v.mainMod .. " + G",
    hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"'),
    { description = "Remove gaps between windows" }
)

-- ### Grouping ###
hl.bind(v.mainMod .. " + K",   hl.dsp.group.toggle(), { description = "Toggles current window group mode (ungroup all related)" })
hl.bind(v.mainMod .. " + Tab", hl.dsp.group.next(),   { description = "Switches to the next window in the group" })
