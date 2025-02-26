return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvimtools/none-ls-extras.nvim',
    },
    config = function()
        local null_ls = require 'null-ls'
        null_ls.setup {
            sources = {
                require 'none-ls.code_actions.eslint_d',
                require 'none-ls.diagnostics.eslint_d',
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.stylua,
            },
        }
    end,
}
