local colorscheme = {
    -- "folke/tokyonight.nvim",
    "shaunsingh/nord.nvim",
    priority = 1000,
}

function colorscheme.config()
    -- require("tokyonight").setup({
    --     undercurl = true,
    --     transparent = true,
    --     dimInactive = true,
    --     --theme = wave,
    -- })
    -- Example config in lua
    vim.g.nord_contrast = true
    vim.g.nord_borders = true
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false

    -- Load the colorscheme
    require("nord").set()

    -- vim.cmd([[colorscheme tokyonight-night]])
    vim.cmd([[colorscheme nord]])
end

-- return {
-- 	{
-- 		--"rebelot/kanagawa.nvim",
-- 		"folke/tokyonight.nvim",
-- 		priority = 1000,
-- 		config = function()
-- 			require("tokyonight").setup({
-- 				undercurl = true,
-- 				transparent = true,
-- 				dimInactive = true,
-- 				--theme = wave,
-- 			})
-- 			vim.cmd([[colorscheme tokyonight-night]])
-- 		end,
-- 	},
-- }

return colorscheme -- Most of the time, people name the object here M for module. I wanted to be different.
