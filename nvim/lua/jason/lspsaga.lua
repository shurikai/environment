local M = {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons", -- optional
    },
}

function M.config()
    require("lspsaga").setup({
        breadcrumbs = {},
        outline = {
            layout = "float",
        },
    })
end

return M
