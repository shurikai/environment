return {
  'neanias/everforest-nvim',
  lazy = false,
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('everforest').setup {
      background = 'hard',
    }
    vim.cmd.colorscheme 'everforest'
  end,
}
