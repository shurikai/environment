local M = {
    "nvim-java/nvim-java",
    dependencies = {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                jdtls = {},
            },
        },
    },
}

M.config = function()
    require("java").setup({})
    require("lspconfig").jdtls.setup({})
end

return M
