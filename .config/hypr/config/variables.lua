-- ### Environment variables ###
hl.env("HYPRCURSOR_SIZE", "24", true)
hl.env("XCURSOR_SIZE", "24", true)
hl.env("QT_CURSOR_SIZE", "24", true)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto") -- Electron based apps use X11 as default, auto should detect wayland
hl.env("XDG_MENU_PREFIX", "plasma-") -- Map to the correct applications.menu config for file associations dialogs

-- ### Load generated colors ###
local colors = require("config.generated_colors")

-- ### General shared variables ###
local vars = {
    -- Applications & Utilities
    filemanager          = "dolphin",
    applauncher          = "wofi",
    terminal             = "alacritty",
    idle_manager         = "swayidle",
    taskbar_manager      = "waybar",
    flux_manager         = "hyprsunset",
    notification_manager = "mako",
    overlay_bar          = "wob",

    -- Behaviour Controls
    SMART_GAPS           = true,
    WINDOW_TRANSPARENCY  = false,
    WINDOW_TITLE_BARS    = true,
    WINDOW_BORDERS       = true,
    MIRROR_TO_TV         = false,

    -- Monitors
    monitor_main = "DP-1",
    monitor_side = "DP-3",
    monitor_tv   = "HDMI-A-1",

    -- Audio
    volume_step = "3%",

    -- Workspaces
    wks_main   = "workspace_main",
    wks_main2  = "workspace_main2",
    wks_gaming = "workspace_gaming",
    wks_side   = "workspace_side",
    wks_tv     = "workspace_tv",

    -- Screenshots
    shot_region = "grimblast --freeze copy area",
    shot_window = "grimblast copy active",
    shot_screen = "grimblast copy output",

    -- Inputs
    mainMod = "SUPER",

    -- Colors (merged from generated_colors.lua)
    color_primary      = colors.color_primary,
    color_secondary    = colors.color_secondary,
    color_tertiary     = colors.color_tertiary,
    color_bg_primary   = colors.color_bg_primary,
    color_bg_secondary = colors.color_bg_secondary,
    color_bg_tertiary  = colors.color_bg_tertiary,

    -- Internal / Detail
    volume_display_pipe = "/tmp/wob_volume_change_listen_pipe",
    scripts_dir = "~/.config/hypr/scripts",
}

-- Make visible to other files
return vars
