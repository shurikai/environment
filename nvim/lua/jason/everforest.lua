local colorscheme = {
    "sainnhe/everforest",
    priority = 1000,
}

function colorscheme.config()
    vim.g.everforest_enable_italic = true
    vim.g.everforest_background = "hard"
    vim.g.everforest_transparent_background = 1

    vim.cmd([[colorscheme everforest]])
end

return colorscheme -- Most of the time, people name the object here M for module. I wanted to be different.
