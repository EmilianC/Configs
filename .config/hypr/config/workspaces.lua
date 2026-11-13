-- https://wiki.hypr.land/configuring/core/rules/workspace-rules/

local v = require("config.variables")

hl.workspace_rule({
    workspace = v.wks_main,
    persistent = true,
    default_name = v.wks_main_name,
    monitor = v.monitor_main,
    default = true,
})

hl.workspace_rule({
    workspace = v.wks_secondary,
    persistent = true,
    default_name = v.wks_secondary_name,
    monitor = v.monitor_main,
})

hl.workspace_rule({
    workspace = v.wks_gaming,
    persistent = true,
    default_name = v.wks_gaming_name,
    monitor = v.monitor_main,
    no_rounding = true,
    no_border = true,
    no_shadow = true,
    decorate = false,
    gaps_out = 0,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = v.wks_side,
    persistent = true,
    default_name = v.wks_side_name,
    monitor = v.monitor_side,
})

hl.workspace_rule({
    workspace = v.wks_tv,
    persistent = true,
    default_name = v.wks_tv_name,
    monitor = v.monitor_tv,
})

-- Smart gaps (no gaps/borders when only 1 tiled or floating window):
if v.SMART_GAPS then
    hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
    hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })

    hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
    hl.window_rule({ match = { float = false, workspace = "f[1]"   }, border_size = 0 })
    hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
    hl.window_rule({ match = { float = false, workspace = "f[1]"   }, rounding = 0 })
end
