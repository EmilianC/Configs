-- https://wiki.hypr.land/configuring/core/rules/workspace-rules/

local v = require("config.variables")

hl.workspace_rule({
    workspace = "1",
    persistent = true,
    default_name = v.wks_main,
    monitor = v.monitor_main,
    default = true,
})

hl.workspace_rule({
    workspace = "2",
    persistent = true,
    default_name = v.wks_main2,
    monitor = v.monitor_main,
})

hl.workspace_rule({
    workspace = "3",
    persistent = true,
    default_name = v.wks_gaming,
    monitor = v.monitor_main,
    no_rounding = true,
    no_border = true,
    no_shadow = true,
    decorate = false,
    gaps_out = 0,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = "4",
    persistent = true,
    default_name = v.wks_side,
    monitor = v.monitor_side,
})

hl.workspace_rule({
    workspace = "5",
    persistent = true,
    default_name = v.wks_tv,
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
