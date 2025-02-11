return {
    { "SmiteshP/nvim-navic", opts = { highlight = true } },
    -- { "hrsh7th/cmp-nvim-lsp" },
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                -- "biome",
                "gopls",
                "eslint_d",
                "js-debug-adapter",
                "prettier",
                "typescript-language-server",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "basedpyright",
                "biome",
                "clangd",
                "lua_ls",
                "jsonls",
                "gopls",
                "yamlls",
                "ts_ls",
            },
            auto_install = true,
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "black",
                "clang-format",
                "delve",
                "flake8",
                "gofumpt",
                "goimports-reviser",
                "golangci-lint",
                "golines",
                "isort",
                "prettier",
                "stylua",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        lazy = false,
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            local lspconfig = require "lspconfig"
            local navic = require "nvim-navic"
            local on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, bufnr)
                end

                if client.supports_method "textDocument/formatting" then
                    vim.api.nvim_clear_autocmds {
                        group = augroup,
                        buffer = bufnr,
                    }
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            local ok, conform = pcall(require, "conform")
                            if ok then
                                conform.format { bufnr = bufnr }
                            else
                                vim.lsp.buf.format { bufnr = bufnr }
                            end
                        end,
                    })
                end
            end

            lspconfig.basedpyright.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            -- lspconfig.biome.setup {
            --     capabilities = capabilities,
            --     on_attach = on_attach,
            -- }
            lspconfig.clangd.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            lspconfig.jsonls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            lspconfig.yamlls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            lspconfig.ts_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                init_options = {
                    preferences = {
                        disableSuggestions = true,
                    },
                },
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
                on_attach = on_attach,
            }
            lspconfig.gopls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                    },
                },
            }
        end,
    },
}
