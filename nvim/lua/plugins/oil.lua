local M = {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
}

function M.config()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    require("oil").setup({
        default_file_explorer = true,
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
    })
end

return M
