local M = {
    "nvim-lua/plenary.nvim",
    "christoomey/vim-tmux-navigator",
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    "mfussenegger/nvim-jdtls",
}

return M
