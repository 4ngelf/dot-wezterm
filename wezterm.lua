-- Wezterm configuration
-- This file prepares the lua environment

--- The wezterm module
_G.wez = require "wezterm"

local min_wezterm_version = "20230320-124340-559cb7b0"
if wez.version < min_wezterm_version then
  error("Update wezterm. You need at least version '" .. min_wezterm_version .. "' to use this configuration")
end

--- [1] The directory separator string. Default is '\' for Windows and '/' for all other systems.
--- [2] The character that separates templates in a path. Default is ';'.
--- [3] The string that marks the substitution points in a template. Default is '?'.
--- [4] A string that, in a path in Windows, is replaced by the executable's directory. Default is '!'.
--- [5] A mark to ignore all text after it when building the luaopen_ function name. Default is '-'.
---
--- Extracted from: https://www.lua.org/manual/5.4/manual.html#pdf-package.config
local package_config = {}
for item in package.config:gmatch "([^\n]+)" do
  table.insert(package_config, item)
end

local function joinpath(...)
  return table.concat({ ... }, package_config[1])
end

--- Try to load local machine specific configuration file.
--- It creates an empty file if it does not already exists.
local function try_load_local_configuration()
  local local_config = ".wezterm.local.lua"
  local local_config_file = joinpath(wez.config_dir, local_config)

  local file = io.open(local_config_file, "r")
  if file then
    -- Load configuration
    local fn, err = load(file:read "a")
    if fn then
      fn()
    else
      wez.log_error(("%s: %s"):format(local_config, err))
    end
  else
    -- Create an empty file
    local f, err = io.open(local_config_file, "a")
    if f then
      f:close()
    else
      wez.log_error(("%s: %s"):format(local_config, err))
    end
  end
end

--
-- package.path configuration
--

local package_path_table = {}

for _, new_path in ipairs {
  joinpath(wez.config_dir, "lua", package_config[3] .. ".lua"),
  joinpath(wez.config_dir, "lua", package_config[3], "init.lua"),
} do
  if not package.path:match(new_path) then
    table.insert(package_path_table, new_path)
  end
end

table.insert(package_path_table, package.path)

package.path = table.concat(package_path_table, package_config[2])

--
-- Load configuration
--

wez.configuration = wez.config_builder()

require "run.plugins"
require "run.events"
require "run.keys"
require "run.etc"

try_load_local_configuration()

return wez.configuration
