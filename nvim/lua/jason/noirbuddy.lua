local M = {
    "jesseleite/nvim-noirbuddy",
    dependencies = {
        { "tjdevries/colorbuddy.nvim" },
    },
    lazy = false,
    priority = 1000,
    opts = {},
}

M.config = function()
    require("noirbuddy").setup({
        preset = "slate",
        colors = {
            primary = "#957FB8",
            secondary = "#D27E99",
            background = "#16161D",
            diagnostic_error = "#C34043",
            diagnostic_warning = "#DCA561",
            diagnostic_info = "#d5d5d5",
            diagnostic_hint = "#f5f5f5",
            diff_add = "#98BB6C",
            diff_change = "#FF9E38",
            diff_delete = "#E82424",
            -- gray scale
            -- noir_0 = "#a6a69c", -- `noir_0` is light for dark themes, and dark for light themes
            -- noir_1 = "#f5f5f5",
            -- noir_2 = "#54546D",
            -- noir_3 = "#363646",
            -- noir_4 = "#2a2a37",
            -- noir_5 = "#1f1f28",
            -- noir_6 = "#1a1a22",
            -- noir_7 = "#181820",
            -- noir_8 = "#16161D",
            -- noir_9 = "#0d0c0c", -- `noir_9` is dark for dark themes, and light for light themes
        },
    })
end

return M
