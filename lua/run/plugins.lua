-- Download/Load plugins
local plugin_list = {
  --[[PLUGINS REPOSITORIES HERE]]
}

for _, repo in ipairs (plugin_list) do
  wez.plugin.require(repo).apply_to_config(wez.configuration)
end
