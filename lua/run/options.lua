-- Set configuration options
local Util = require "util"
local c = wez.configuration

c.font = wez.font "JetBrains Mono"
c.prefer_to_spawn_tabs = true
c.use_fancy_tab_bar = false
c.tab_bar_at_bottom = true
c.window_padding = {
  left = "1cell",
  right = 5,
  top = 0,
  bottom = 0,
}

-- TODO: Move this to a module for managing backgrounds and colors
local schema = {
  Dark = "Catppuccin Macchiato",
  Light = "Catppuccin Latte",
}
schema.DarkHighContrast = schema.Dark
schema.LightHighContrast = schema.Light

c.color_scheme = schema[wez.gui.get_appearance()]
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
        path = Util.asset "toon-link.gif",
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
