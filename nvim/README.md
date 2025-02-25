# Neovim Config

## Structure
- Custom plugin-like code in lua/stickies etc

## Neovim Load Order
1. init.lua
2. plugin/init.lua and plugin/\*.lua
3. lua/plugin/init.lua - loaded by Lazy
4. lua/plugin/\*.lua - loaded by Lazy

## Configuration Roadmap:
1. Load init.lua
    1. Bootstrap Lazy
    2. Handle any up-front configuration
2. Automatically load plugin/
    1. Keymaps
    2. Options
    3. Autocmds
3. Let Lazy load the plugins in lua/plugins
4. Automatically load custom code in after/plugin and after/ftplugin

