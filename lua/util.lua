--- Utilities for configuration.
local M = {}

M.path = require "util.path"

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

return M
