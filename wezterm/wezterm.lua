local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Existing settings
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE | RESIZE" 
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "Tokyo Night (Storm)"
config.font_size = 12
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 1
config.animation_fps = 120
config.scrollback_lines = 10000

config.colors = {
  background = "#1e1e2e", 
}


config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config

