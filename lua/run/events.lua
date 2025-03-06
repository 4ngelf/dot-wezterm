-- Set custom event handlers
local mux = wez.mux

local first_gui_startup = true
wez.on('gui-startup', function(cmd)
  if first_gui_startup then
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
    first_gui_startup = false
  end
end)
