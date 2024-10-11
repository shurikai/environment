vim.cmd("let g:netrw_liststyle = 3")

vim.g.have_nerd_font = true

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.numberwidth = 4

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false
opt.scrolloff = 8

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false

opt.showmode = false

opt.undofile = true

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split'
