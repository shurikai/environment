return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.cppcheck,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.prettier,
                -- null_ls.builtins.formatting.ruff,
                null_ls.builtins.formatting.stylua,
            },
        })
    end,
}
