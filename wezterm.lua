-- Wezterm configuration
_G.wez = require "wezterm"

local min_wezterm_version = "20230320-124340-559cb7b0"
if wez.version < min_wezterm_version then
  error("Update wezterm. You need at least version '" .. min_wezterm_version .. "' to use this configuration")
end

-- Ensure modules are in `package.path`
do
  local dir_sep, path_sep, sub_tok = package.config:match "(.)\n(.)\n(.)"

  local modfile = table.concat({ wez.config_dir, "lua", sub_tok .. ".lua" }, dir_sep)
  local moddir = table.concat({ wez.config_dir, "lua", sub_tok, "init.lua" }, dir_sep)

  package.path = table.concat({ modfile, moddir, package.path }, path_sep)
end

wez.configuration = wez.config_builder()

-- Load modules with side effects on `wez.configuration`
require "run.plugins"
require "run.events"
require "run.keys"
require "run.etc"

-- Local machine specific configuration
do
  local local_config = wez.config_dir .. "/.wezterm.local.lua"

  local file = io.open(local_config)
  if file then
    local run_local_config, err = load(file:read "a")
    file:close()

    if run_local_config then
      run_local_config()
    else
      wez.log_error(local_config, ":", err)
    end
  end
end

return wez.configuration
