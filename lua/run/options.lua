-- Set configuration options
local Util = require "util"
local c = wez.configuration

--- Use this snippet to choose based on system color mode
--
-- local theme = {
--   Dark = "Catppuccin Macchiato",
--   Light = "Catppuccin Latte",
-- }
-- theme.DarkHighContrast = theme.Dark
-- theme.LightHighContrast = theme.Light
--
-- c.color_scheme = theme[wez.gui.get_appareance()]
c.color_scheme = "Catppuccin Macchiato"
c.font = wez.font "JetBrains Mono"

-- processes
c.prefer_to_spawn_tabs = true

-- appareance
c.use_fancy_tab_bar = false
c.tab_bar_at_bottom = true
c.window_padding = {
  left = "1cell",
  right = 5,
  top = 0,
  bottom = 0,
}
c.background = {
  {
    source = {
      Color = wez.get_builtin_color_schemes()[c.color_scheme].background,
    },
    width = "100%",
    height = "100%",
    opacity = 0.95,
  },
  {
    source = {
      File = {
        path = Util.asset "wezterm-bg.gif",
        speed = 0.2,
      },
    },
    height = "150",
    width = "300",
    repeat_y = "NoRepeat",
    repeat_x = "NoRepeat",
    vertical_align = "Bottom",
    horizontal_align = "Right",
    vertical_offset = "-1cell",
    horizontal_offset = "5%",
  },
}
