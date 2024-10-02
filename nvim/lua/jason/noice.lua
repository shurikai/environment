local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
}

function M.config()
    require("noice").setup({
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        routes = {
            {
                filter = {
                    event = "lsp",
                    kind = "progress",
                    cond = function(message)
                        local client = vim.tbl_get(message.opts, "progress", "client")
                        if client ~= "jdtls" then
                            return true
                        end

                        local content = vim.tbl_get(message.opts, "progress", "message")
                        if content == nil then
                            return false
                        end

                        return string.find(content, "Validate") or string.find(content, "Publish")
                    end,
                },
                opts = { skip = true },
            },
        },
    })
end

return M
