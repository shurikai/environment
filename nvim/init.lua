require("jason.autocmds")
require("jason.options")
require("jason.keymaps")
require("jason.pluginspec")

-- [[ Colorschemes ]] --
spec("jason.kanagawa") -- colorscheme
-- spec("jason.colorscheme")
-- spec("jason.noirbuddy") -- colorscheme
-- spec("jason.everforest") -- colorscheme

spec("jason.autoformat")
spec("jason.autopairs")
spec("jason.mini")
spec("jason.lualine")
spec("jason.lsp")
spec("jason.lspsaga")
spec("jason.nvim-dap-ui")
spec("jason.nvim-dap-virtual-text")
-- spec("jason.nvim-java")
spec("jason.diffview")
-- spec("jason.noice")
spec("jason.neotree")
spec("jason.oil")
spec("jason.colorizer")
spec("jason.treesitter")
spec("jason.cmp")
spec("jason.telescope")
spec("jason.project")
spec("jason.test")

spec("jason.misc")

spec("jason.neogit")
spec("jason.gitsigns")

require("jason.lazy")
