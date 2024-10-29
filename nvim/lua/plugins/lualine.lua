return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            icons_enabled = true,
            -- theme = "auto",
            theme = "catppuccin",
            -- theme = "gruvbox",
            -- component_separators = { left = "", right = "" },
            component_separators = { left = "/", right = "/" },
            -- section_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = { "neo-tree" },
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = function(str)
                        return "   " .. str:sub(1, 1)
                    end,
                },
            },
            lualine_b = {
                "branch",
                {
                    "diff",
                    symbols = {
                        added = " ",
                        modified = "󰾞 ",
                        removed = " ",
                    },
                },
                "diagnostics",
            },
            lualine_c = {
                {
                    "filetype",
                    icon_only = true,
                },
                {
                    "filename",
                    newfile_status = true,
                    path = 1,
                    symbols = {
                        modified = " ",
                        readonly = " ",
                        newfile = " ",
                    },
                },
            },
            -- lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_x = { "searchcount", "selectioncount" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        -- winbar = { require("lspsaga.symbol.winbar").get_bar() },
        winbar = {
            lualine_a = {},
            lualine_b = { "branch" },
            lualine_c = {
                {
                    draw_empty = true,
                    function()
                        local navic = require("nvim-navic")
                        local has_navic = navic.is_available()
                        if has_navic then
                            return navic.get_location()
                        else
                            return vim.fn.expand("%:p:~:.:h")
                        end
                    end,
                },
            },
            -- lualine_x = {},
            -- lualine_y = {},
            -- lualine_z = {},
        },
        inactive_winbar = {},
        extensions = { "quickfix" },
    },
}
