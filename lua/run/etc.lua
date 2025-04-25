-- Set configuration options
local c = this.configuration

c.enable_kitty_keyboard = true
c.font = wez.font "JetBrains Mono"
c.prefer_to_spawn_tabs = true
c.tab_bar_at_bottom = true
c.use_fancy_tab_bar = false
c.window_padding = { left = "1cell", right = 5, top = 0, bottom = 0 }

-- TODO: Move this to a module for managing backgrounds and colors
local function get_appearance()
  if wez.gui then
    return wez.gui.get_appearance()
  else
    return "Dark"
  end
end

local schema = {
  Dark = "Catppuccin Macchiato",
  Light = "Catppuccin Latte",
}
schema.DarkHighContrast = schema.Dark
schema.LightHighContrast = schema.Light

c.color_scheme = schema[get_appearance()]
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
        path = this.asset "toon-link.gif",
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
