return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            rust = { "rustfmt", lsp_format = "fallback" },
            -- Conform will run the first available formatter
            javascript = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettier", "fixjson", stop_after_first = true },
            go = { "gofumpt", "goimports-revieser", "golines" },
            typescript = { "prettier", "prettierd", stop_after_first = true },
        },
    },
}
