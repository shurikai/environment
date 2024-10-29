return {
    { "SmiteshP/nvim-navic", opts = { highlight = true } },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "basedpyright",
                "lua_ls",
                "jdtls",
                "jsonls",
                "gopls",
                "yamlls",
            },
            auto_install = true,
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "black",
                "delve",
                "flake8",
                "gofumpt",
                "golangci-lint",
                "isort",
                "java-test",
                "java-debug-adapter",
                "google-java-format",
                "stylua",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            local navic = require("nvim-navic")
            local on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, bufnr)
                end
            end

            lspconfig.basedpyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.solargraph.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
                on_attach = on_attach,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end,
    },
}
