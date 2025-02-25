return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
    },
    vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { desc = "Test nearest" }),
    vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { desc = "Test File" }),
    vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { desc = "Test Suite" }),
    vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { desc = "Test Last" }),
    -- vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { desc = "Test Visit" }),
    vim.cmd("let test#strategy = 'vimux'"),
}

-- function M.config()
--     require("nvim-navic").setup({
--         highlight = true,
--         lsp = {
--             auto_attach = true,
--         },
--         click = true,
--         depth_limit = 0,
--         depth_limit_indicator = "..",
--     })
-- end
