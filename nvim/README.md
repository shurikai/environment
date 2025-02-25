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

## Plugins
### Basic
1. Mason
2. mason-lspconfig
3. mason-tool-installer
4. nvim-lspconfig
5. lualine
6. snacks picker/explorer
7. none-ls
8. navic
9. treesitter
### Git / Diff
1. Gitsigns
2. Diffview
3. Neogit (?)
### Editing
1. Blink
2. Conform (?)
3. Debugging
    1. nvim-dap
    2. nvim-dap-ui
    3. nvim-dap-virtual-text
4. snacks indent
### QoL
1. nvim colorizer
2. LazyDev
3. Colorscheme (probably only one of...)
    1. catppuccin
    2. kanagawa
    3. everforest
    4. zenbones
    5. warlock
4. mini
5. snacks statuscolumn
6. snacsk notifier
7. rainbow-delimeters
8. trouble
