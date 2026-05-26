-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
-- config.initial_cols = 120
-- config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 11
-- config.color_scheme = 'AdventureTime'

-- Finally, return the configuration to wezterm:

config.color_scheme = "Kanagawa Dragon (Gogh)"
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font("JetBrainsMono Nerd Font")

-- pass through ctrl tab to zellij
local act = wezterm.action
config.keys = {
  -- Disable Ctrl+Tab (next tab) so it passes through to Zellij
  {
    key = "Tab",
    mods = "CTRL",
    action = act.DisableDefaultAssignment,
  },
  -- Optionally also disable Ctrl+Shift+Tab (previous tab)
  {
    key = "Tab",
    mods = "CTRL|SHIFT",
    action = act.DisableDefaultAssignment,
  },
}

config.mouse_bindings = {
  -- Scroll up slower
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = "NONE",
    action = act.ScrollByLine(-1), -- Change -1 to -2 or -3 if you want faster
    alt_screen = false,
  },
  -- Scroll down slower
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = "NONE",
    action = act.ScrollByLine(1), -- Change to 2 or 3 if you want faster
    alt_screen = false,
  },
}
return config
