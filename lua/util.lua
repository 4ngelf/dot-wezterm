--- Utilities for wezterm configuration
local M = {}

--- Inspect environment variables
---
---@example [[
---local Util = require "util"
---assert(Util.env.HOME == os.getenv("HOME"))
---]]
---@type { string: string? }
M.env = setmetatable({}, {
  __index = function(_, env_name)
    return os.getenv(env_name)
  end,
})

--- Get path to an asset from the `assets` directory
---@param asset string Relative path of asset
---@return strign
function M.asset(asset)
  -- TODO: Replace with a function from a path manipulation lib
  local sep = package.config:match "(.)"
  return table.concat({ wez.config_dir, "assets", asset }, sep)
end

return M
