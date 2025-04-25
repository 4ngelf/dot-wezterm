-- Download/Load plugins
local plugin_list = {
  --[[PLUGINS REPOSITORIES HERE]]
}

for _, plugin in ipairs(plugin_list) do
  local link = plugin[1]
  local plugin_config = plugin[2]
  wez.plugin.require(link).apply_to_config(wez.configuration, plugin_config)
end
