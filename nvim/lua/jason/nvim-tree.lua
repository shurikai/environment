local M = {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
        view = {
            width = 35,
            relativenumber = true,
        },

        --actions = {
        --open_file = {
        --window_picker = {
        --enable = false,
        --},
        --}.
        --},

        filters = {
            custom = { ".DS_Store" },
        },
        git = {
            ignore = false,
        },
    })

    local keymap = vim.keymap.set
    keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
    keymap("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
    keymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
    keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
end

return M
