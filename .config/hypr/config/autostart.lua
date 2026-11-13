-- https://wiki.hypr.land/configuring/core/autostart/

local v = require("config.variables")

hl.on("hyprland.start", function()
    -- Create a watcher to display a volume control bar
    hl.exec_cmd("mkfifo " .. v.volume_display_pipe)
    hl.exec_cmd("sh " .. v.scripts_dir .. "/reload/" .. v.overlay_bar .. ".sh")

    -- Background manager
    hl.exec_cmd("sh " .. v.scripts_dir .. "/wallpaperctl.sh \"$(< " .. v.scripts_dir .. "/.wallpaper_state)\"")

    -- PC Idle handler
    hl.exec_cmd(v.idle_manager .. " -w timeout 2000 'swaymsg \"output * dpms off\"' resume 'swaymsg \"output * dpms on\"'")

    -- Taskbar and notifications
    hl.exec_cmd(v.taskbar_manager)
    hl.exec_cmd(v.notification_manager)

    -- Allow GUI prompts for authentication
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

    -- Slow app launch fix
    hl.exec_cmd("systemctl --user import-environment")
    hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null")
    hl.exec_cmd("dbus-update-activation-environment --systemd")

    -- Ensure plugins are loaded correctly
    hl.exec_cmd("hyprpm reload")

    -- Ensure file association cache is up to date
    hl.exec_cmd("kbuildsycoca6 --noincremental")
end)
