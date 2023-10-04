-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.font = wezterm.font "FiraMono Nerd Font Mono"
config.font_size = 11.0

config.audible_bell = "Disabled"

-- config.window_background_opacity = 0.95
-- config.color_scheme_dirs = { "$HOME/.config/wezterm/colors" }
config.color_scheme = "github_dark_colorblind"
-- config.color_scheme = "github_light_colorblind"

config.leader = { key = " ", mods = "CTRL" }
config.keys = {
    {
        key = "q",
        mods = "LEADER",
        action = act.CloseCurrentPane({ confirm = true }),
    },
    {
        key = "n",
        mods = "SHIFT|CTRL",
        action = act.ToggleFullScreen,
    },
    {
        key = "v",
        mods = "LEADER",
        action = act.SplitHorizontal({ domain = "CurrentPaneDomain" })
    },
    {
        key = "s",
        mods = "LEADER",
        action = act.SplitVertical({ domain = "CurrentPaneDomain" })
    },
    -- move between panes
    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "b", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
    { key = "f", mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },
}

-- and finally, return the configuration to wezterm
return config
