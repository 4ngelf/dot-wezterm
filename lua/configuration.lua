--- The wezterm module
_G.wez = require "wezterm"
--- Utilities for configuration
_G.util = require "util"
--- configuration to send to wezterm
_G.configuration = wez.config_builder()

require "configuration.plugins"
require "configuration.events"
require "configuration.keys"
require "configuration.etc"

local local_config_file = util.path.config_file ".wezterm.local.lua"

local local_loader, err = loadfile(local_config_file)
if local_loader then
  _, err = pcall(local_loader)
else
  -- Ensure the file exists for future editing
  local f = io.open(local_config_file, "a")
  if f then
    f:close()
  end
end

if err then
  wez.log_error(err)
end

return configuration
