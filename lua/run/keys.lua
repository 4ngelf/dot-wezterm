--- Set keybindings
local act = wez.action

local c = wez.configuration

c.leader = {
  key = " ",
  mods = "CTRL",
  timeout_milliseconds = 1000,
}

c.keys = c.keys and c.keys or {}

local function bind(keybinding)
  table.insert(c.keys, keybinding)
end

-- This is a test for keybinds with notifications
bind {
  key = "t",
  mods = "LEADER",
  action = wez.action_callback(function(win, pane)
    local msg = "Toasty!"
    win:toast_notification("wezterm", msg, nil, 4000)
    wez.log_info(msg)
  end),
}
