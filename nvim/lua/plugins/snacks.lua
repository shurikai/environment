return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        dashboard = {
            sections = {
                { section = "header" },
                -- { section = "keys", gap = 1 },
                -- { section = "recent_files", indent = 2, padding = { 2, 2 } },
                {
                    section = "recent_files",
                    icon = " ",
                    title = "Recents",
                    cwd = true,
                    padding = { 2, 2 },
                },
                -- { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
                { section = "startup" },
            },
        },
        -- bigfile = { enabled = true },
        notifier = { enabled = true },
        -- quickfile = { enabled = true },
        -- statuscolumn = { enabled = true },
        -- words = { enabled = true },
    },
}
