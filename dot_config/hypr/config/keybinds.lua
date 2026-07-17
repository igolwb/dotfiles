local mainMod = "SUPER"
local ipc = "noctalia msg"
local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")

local layouts = { "dwindle", "master", "scrolling" }
local workspace_layouts = {}

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Z", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + ALT + Left", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + ALT + Right", hl.dsp.layout("swapcol r"))



hl.bind(mainMod .. " + R", function()
    hl.dispatch(hl.dsp.layout("colresize +conf"))
end)

-- Change focus
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())

-- Move active window around current workspace
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + CONTROL + SHIFT + Left", hl.dsp.window.move({ workspace = "r-1" }))

-- Move & Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

------------------
---- LAUNCHER ----
------------------

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(launchPrefix .. TERMINAL))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e yazi"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(launchPrefix .. EDITOR))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(launchPrefix .. BROWSER))
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"))
hl.bind(mainMod .. "+X", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mainMod .. "+Space", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume muteOutput"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. "volume muteInput"), { locked = true })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. "media playPause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(ipc .. "media playPause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. "media next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(ipc .. "media previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness decrease"), { locked = true, repeating = true })

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(ipc .. " screenshot-region"))


-- Theming and Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher /wall "))

-- Clipboard
hl.bind(mainMod .. "+C", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"))

--------------------
---- WORKSPACES ----
--------------------

--Change layouts per workspace

hl.bind(mainMod .. "+ l", function()
    local special = hl.get_active_special_workspace()
    local ws = special or hl.get_active_workspace()
    local ws_key = ws.id

    local current = workspace_layouts[ws_key] or 1
    local next_idx = (current % #layouts) + 1
    workspace_layouts[ws_key] = next_idx
    hl.workspace_rule({ workspace = ws.name, layout = layouts[next_idx] })
end)

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move through workspaces
hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.focus({ workspace = "empty" }))
hl.bind(mainMod .. " + CONTROL + ALT + Right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + CONTROL + ALT + Left", hl.dsp.window.move({ workspace = "r-1" }))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special" }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special())
