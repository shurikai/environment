return {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.8",
    enabled = true,

    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        {
            "nvim-telescope/telescope-ui-select.nvim",
            opts = {}
        },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },

    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
            -- path_display = { "filename_first" },
        })
        require("telescope").load_extension("ui-select")
    end,
}
