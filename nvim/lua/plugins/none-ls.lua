return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- null_ls.builtins.diagnostics.flake8,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.prettier,
                -- null_ls.builtins.formatting.ruff,
                null_ls.builtins.formatting.stylua,
            },
        })
    end,
}

