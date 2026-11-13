-- https://wiki.hypr.land/configuring/core/monitors/

local v = require("config.variables")

hl.monitor({
    output = v.monitor_main,
    mode = "2560x1440@144",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = v.monitor_side,
    mode = "1920x1080@75",
    position = "2560x289",
    scale = 1,
    transform = 1, -- (rotated 90 degrees)
})

if v.MIRROR_TO_TV then
    hl.monitor({
        output = v.monitor_tv,
        mode = "3840x2160@60",
        position = "3640x400",
        scale = 2.5,
        mirror = v.monitor_main,
    })
else
    hl.monitor({
        output = v.monitor_tv,
        mode = "3840x2160@60",
        position = "3640x400",
        scale = 2.5,
    })
end

-- Fallback monitor rule (auto-detects any other monitors)
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})
