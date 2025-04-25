--- This wezterm configuration.
--- Contains utilities and the global configuration table, `this.configuration`,
--- which will be send to wezterm later.
local this = {}

--- Wezterm configuration. Will be send to wezterm later.
this.configuration = wez.config_builder()

--- Inspect environment variables
---
---@example [[
---local Util = require "util"
---assert(Util.env.HOME == os.getenv("HOME"))
---]]
---@type { string: string? }
this.env = setmetatable({}, {
  __index = function(_, env_name)
    return os.getenv(env_name)
  end,
})

--- Get path to an asset from the `assets` directory
---@param asset string Relative path of asset
---@return strign
function this.asset(asset)
  -- TODO: Replace with a function from a path manipulation lib
  local sep = package.config:match "(.)"
  return table.concat({ wez.config_dir, "assets", asset }, sep)
end

return this
