return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            dim_inactive = {
                enabled = true, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            color_overrides = {},
            default_integrations = true,
            integrations = {
                blink_cmp = true,
                cmp = false,
                gitsigns = true,
                neotree = true,
                treesitter = true,
                navic = true,
                notify = false,
                mason = true,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                indent_blankline = {
                    enabled = true,
                    scope_color = "peach", -- catppuccin color (eg. `lavender`) Default: text
                    colored_indent_levels = true,
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        }
        vim.cmd.colorscheme "catppuccin"
    end,
}
