return {
    "nvim-lua/plenary.nvim",
    "christoomey/vim-tmux-navigator",
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        opts = { signs = false },
    },
    { "mfussenegger/nvim-jdtls", ft = "java" },
    "vim-test/vim-test",
    config = function() end,
}
