local M = {
    "neogitorg/neogit",
    event = "VeryLazy",
}

function M.config()
    vim.keymap.set("n", "<Leader>ng", ":Neogit<CR>", { desc = "[N]eo[g]it" })
    require("neogit").setup({
        auto_refresh = true,
        disable_builtin_notifications = false,
        use_magit_keybindings = false,
        graph_style = "unicode",
        -- Change the default way of opening neogit
        kind = "replace",
        commit_editor = {
            kind = "split",
        },
        -- Change the default way of opening the commit popup
        commit_popup = {
            kind = "split",
        },
        -- Change the default way of opening popups
        popup = {
            kind = "split",
        },
        -- customize displayed signs
        signs = {
            -- { CLOSED, OPENED }
            hunk = { "", "" },
        },
    })
end

return M
