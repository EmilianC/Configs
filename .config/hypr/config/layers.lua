-- https://wiki.hypr.land/configuring/core/rules/layer-rules/

local v = require("config.variables")

hl.layer_rule({
    match = { namespace = v.taskbar_manager },
    animation = "slide down",
})

hl.layer_rule({
    match = { namespace = v.applauncher },
    dim_around = true,
})

hl.layer_rule({
    match = { namespace = v.overlay_bar },
    no_anim = true,
})
