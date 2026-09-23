-- Montior wiki https://wiki.hypr.land/Configuring/Basics/Monitors/

-- @*** is the refresh rate for the monitor,
-- do not set it over the value that your monitor uses

hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@100",
    position = "0x0",
    scale    = "auto",
})
