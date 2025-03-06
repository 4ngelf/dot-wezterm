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

  local new_path_parts = {}
  if not package.path:match (modfile) then
    table.insert(new_path_parts, modfile)
  end
  if not package.path:match (moddir) then
    table.insert(new_path_parts, moddir)
  end
  table.insert(new_path_parts, package.path)

  package.path = table.concat(new_path_parts, path_sep)
end

wez.configuration = wez.config_builder()

-- Load modules with side effects on `wez.configuration`
require "run.plugins"
require "run.options"
require "run.keys"
require "run.events"

-- Local machine specific configuration
do
  local local_config = ".local-machine-wezterm-config.lua"
  -- TODO: Replace with a function from a path manipulation lib
  local sep = package.config:match "(.)"

  local f, err = loadfile(wez.config_dir .. sep .. local_config)
  if f then
    f()
  else
    wez.log_error(("%s: %s"):format(local_config, err))
  end
end

return wez.configuration
