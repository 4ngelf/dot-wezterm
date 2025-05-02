--- Path manipulation
---@class util.path
local M = {}

M.package = {}

--- [1] The directory separator string. Default is '\' for Windows and '/' for all other systems.
--- [2] The character that separates templates in a path. Default is ';'.
--- [3] The string that marks the substitution points in a template. Default is '?'.
--- [4] A string that, in a path in Windows, is replaced by the executable's directory. Default is '!'.
--- [5] A mark to ignore all text after it when building the luaopen_ function name. Default is '-'.
---
--- Extracted from: https://www.lua.org/manual/5.4/manual.html#pdf-package.config
M.package.config = {}

for item in package.config:gmatch "([^\n]+)" do
  table.insert(M.package.config, item)
end

--- Join two paths
---@param ... string Parts of a path
---@return string
function M.join(...)
  local parts = { ... }
  return table.concat(parts, M.package.config[1])
end

--- like path.join() but the root is `wezterm.config_dir`
---@param ... string Parts of a path
---@return string
function M.config_file(...)
  return M.join(wez.config_dir, ...)
end

--- like path.join() but the root is the `assets` directory
---@param asset string Relative path of asset
---@return strign
function M.asset(asset)
  return M.config_file("assets", asset)
end

return M
