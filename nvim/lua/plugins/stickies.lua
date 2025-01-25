return {
    "stickies.nvim",
    dir = "/Users/jason/development/stickies.nvim",
    dev = true,
    lazy = false,
    init = function()
        ---@module 'stickies'
        ---@type stickies.UserConfig
        vim.g.stickies = {
            anchor = "SE",
            height = 0.4,
            width = 0.3,
        }
    end,
    keys = {
        {
            "<leader>so",
            "<plug>(StickiesShow)",
            desc = "Open Stickynote window.",
            mode = { "n", "v" },
        },
        {
            "<leader>sh",
            "<plug>(StickiesHide)",
            desc = "Hide Stickynote window.",
            mode = { "n", "v" },
        },
    },
}
