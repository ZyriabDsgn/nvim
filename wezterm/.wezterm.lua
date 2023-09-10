-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.font = wezterm.font 'FiraMono Nerd Font Mono'
config.font_size = 11.0

config.audible_bell = 'Disabled'

config.window_background_opacity = 0.95
-- config.color_scheme_dirs = { "$HOME/.config/wezterm/colors" }
config.color_scheme = "github_dark_colorblind"

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

-- and finally, return the configuration to wezterm
return config

