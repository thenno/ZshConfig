function load_plugin() {
  local base_path=$1
  local plugin="$2"

  local plugin_directory="$base_path/$plugin"

  if [[ -d "$plugin_directory" && -f "$plugin_directory/$plugin.plugin.zsh" ]]; then
    source "$plugin_directory/$plugin.plugin.zsh"
  else
    echo "Error: Invalid or missing plugin directory for $plugin: $plugin_directory"
  fi
}