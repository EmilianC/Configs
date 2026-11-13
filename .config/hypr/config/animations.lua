-- https://wiki.hypr.land/Configuring/core/Animations/

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("overshot",       { type = "bezier", points = { {0.13, 0.99}, {0.29, 1.10} } })

-- Smoothing
hl.curve("easein",         { type = "bezier", points = { {0.12, 0},     {0.39, 0} } })
hl.curve("easeout",        { type = "bezier", points = { {0.39, 0.575}, {0.565, 1} } })
hl.curve("easeinout",      { type = "bezier", points = { {0.445, 0.05}, {0.55, 0.95} } })

-- Quadratic - Extra smoothing
hl.curve("easein_quad",    { type = "bezier", points = { {0.55, 0.085}, {0.68, 0.53} } })
hl.curve("easeout_quad",   { type = "bezier", points = { {0.25, 0.46},  {0.45, 0.94} } })
hl.curve("easeinout_quad", { type = "bezier", points = { {0.455, 0.03}, {0.515, 0.955} } })

-- Animations
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 1.5, bezier = "easeout_quad", style = "popin 20%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.5, bezier = "easein_quad",  style = "popin 20%" })
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 1.5, bezier = "easeinout_quad" })
hl.animation({ leaf = "border",        enabled = true, speed = 1,   bezier = "easein" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 2,   bezier = "easeout" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2,   bezier = "easeout" })
hl.animation({ leaf = "layers",        enabled = true, speed = 1,   bezier = "easeout_quad" })
hl.animation({ leaf = "fade",          enabled = true, speed = 1,   bezier = "easeout_quad" })
