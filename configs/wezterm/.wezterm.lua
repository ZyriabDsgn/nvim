-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

local function is_linux()
    return io.popen("uname -s"):read() == "Linux"
end

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font "FiraMono Nerd Font Mono"

if is_linux() then
    config.font_size = 10.3
    config.audible_bell = "Disabled"
    config.window_background_opacity = 0.95
else
    config.font_size = 11.0
    config.window_background_opacity = 0.85
end

config.color_scheme = "github_dark_colorblind"
-- config.color_scheme = "github_light_colorblind"
-- config.color_scheme_dirs = { "$HOME/.config/wezterm/colors" }

config.leader = { key = " ", mods = "CTRL" }
config.keys = {
    { key = "q", mods = "LEADER",     action = act.CloseCurrentPane({ confirm = true }), },
    { key = "n", mods = "SHIFT|CTRL", action = act.ToggleFullScreen, },
    { key = "v", mods = "LEADER",     action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "s", mods = "LEADER",     action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    -- move between panes
    { key = "h", mods = "LEADER",     action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER",     action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER",     action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER",     action = act.ActivatePaneDirection("Right") },
    { key = "b", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
    { key = "f", mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },
}

return config
