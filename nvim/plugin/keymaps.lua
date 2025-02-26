-- Keymap function alias.
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }
local opt = function(partial)
    return vim.tbl_deep_extend('force', opts, partial or {})
end

-- [[ Setup Leader Key ]] --
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- [[ Normal Mode ]] --
-- Resize window with arrow keys --
keymap('n', '<M-k>', ':resize -2<CR>', opts)
keymap('n', '<M-j>', ':resize +2<CR>', opts)
keymap('n', '<M-h>', ':vertical resize -2<CR>', opts)
keymap('n', '<M-l>', ':vertical resize +2<CR>', opts)

-- Window Navigation
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

-- Close current buffer (force) --
keymap('n', '<S-q>', '<cmd>bdelete!<CR>', opts)

-- [[ Insert Mode ]] --

-- [[ Visual Mode ]] --
-- Better visual paste --
keymap('v', 'p', '"_dP', opts)

-- [[ Snacks ]] --
-- Buffers
keymap('n', '<leader>bo', function() Snacks.bufdelete.other() end, opt({ desc = 'Snacks Close Other Buffers' }))
-- Top Pickers & Explorer
keymap('n', '<leader><space>', function() Snacks.picker.smart() end, opt({ desc = 'Snacks Smart Find Files' }))
keymap('n', '<leader>,', function() Snacks.picker.buffers() end, opt({ desc = 'Snacks Buffers Picker' }))
keymap('n', '<leader>/', function() Snacks.picker.grep() end, opt({ desc = 'Snacks Grep' }))
keymap('n', '<leader>:', function() Snacks.picker.command_history() end, opt({ desc = 'Snacks Command History', }))
keymap('n', '<leader>N', function() Snacks.picker.notifications() end, opt({ desc = 'Snacks Notification History', }))
keymap('n', '<leader>e', function() Snacks.explorer() end, opt({ desc = 'Snacks File Explorer', }))
-- Find
keymap('n', '<leader>fc', function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end,
    opt({ desc = 'Snacks Find Config File', }))
keymap('n', '<leader>ff', function() Snacks.picker.files() end, opt({ desc = 'Snacks Find Files', }))
keymap('n', '<leader>fg', function() Snacks.picker.git_files() end, opt({ desc = 'Snacks Find Git Files', }))
keymap('n', '<leader>fp', function() Snacks.picker.projects() end, opt({ desc = 'Snacks Find Projects', }))
keymap('n', '<leader>fr', function() Snacks.picker.recent() end, opt({ desc = 'Snacks Find Recent', }))
-- Git
keymap('n', '<leader>gb', function() Snacks.picker.git_branches() end, opt({ desc = 'Snacks Git Branches', }))
keymap('n', '<leader>gB', function() Snacks.gitbrowse() end, opt({}))
keymap('n', '<leader>gl', function() Snacks.picker.git_log() end, opt({ desc = 'Snacks Git Log', }))
keymap('n', '<leader>gL', function() Snacks.picker.git_log_line() end, opt({ desc = 'Snacks Git Log Line', }))
keymap('n', '<leader>gs', function() Snacks.picker.git_status { layout = { preset = 'sidebar', preview = true } } end,
    opt({ desc = 'Snacks Git Status', }))
keymap('n', '<leader>gS', function() Snacks.picker.git_stash() end, opt({ desc = 'Snacks Git Stash', }))
keymap('n', '<leader>gd', function() Snacks.picker.git_diff() end, opt({ desc = 'Snacks Git Diff (Hunks)', }))
keymap('n', '<leader>gf', function() Snacks.picker.git_log_file() end, opt({ desc = 'Snacks Git Log File', }))
-- Grep
keymap('n', '<leader>sb', function() Snacks.picker.lines() end, opt({ desc = 'Snacks Grep Buffer Lines', }))
keymap('n', '<leader>sB', function() Snacks.picker.grep_buffers() end, opt({ desc = 'Snacks Grep Open Buffers', }))
keymap('n', '<leader>sg', function() Snacks.picker.grep() end, opt({ desc = 'Snacks Grep', }))
keymap({ 'n', 'x' }, '<leader>sw', function() Snacks.picker.grep_word() end,
    opt({ desc = 'Snacks Visual selection or word', }))
-- search
keymap('n', '<leader>s"', function() Snacks.picker.registers() end, opt({ desc = 'Snacks Registers', }))
keymap('n', '<leader>s/', function() Snacks.picker.search_history() end, opt({ desc = 'Snacks Search History', }))
keymap('n', '<leader>sa', function() Snacks.picker.autocmds() end, opt({ desc = 'Snacks Search Autocmds', }))
keymap('n', '<leader>sc', function() Snacks.picker.command_history() end,
    opt({ desc = 'Snacks Search Command History', }))
keymap('n', '<leader>sC', function() Snacks.picker.commands() end, opt({ desc = 'Snacks Search Commands', }))
keymap('n', '<leader>sd', function() Snacks.picker.diagnostics() end, opt({ desc = 'Snacks Diagnostics', }))
keymap('n', '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, opt({ desc = 'Snacks Buffer Diagnostics', }))
keymap('n', '<leader>sh', function() Snacks.picker.help() end, opt({ desc = 'Snacks Help Pages', }))
keymap('n', '<leader>sH', function() Snacks.picker.highlights() end, opt({ desc = 'Snacks Highlights', }))
keymap('n', '<leader>si', function() Snacks.picker.icons() end, opt({ desc = 'Snacks Icons', }))
keymap('n', '<leader>sj', function() Snacks.picker.jumps() end, opt({ desc = 'Snacks Jumplist', }))
keymap('n', '<leader>sk', function() Snacks.picker.keymaps() end, opt({ desc = 'Snacks Keymaps', }))
keymap('n', '<leader>sl', function() Snacks.picker.loclist() end, opt({ desc = 'Snacks Location List', }))
keymap('n', '<leader>sm', function() Snacks.picker.marks() end, opt({ desc = 'Snacks Marks', }))
keymap('n', '<leader>sM', function() Snacks.picker.man() end, opt({ desc = 'Snacks Man Pages', }))
keymap('n', '<leader>sp', function() Snacks.picker.lazy() end, opt({ desc = 'Snacks Search for Lazy Plugin Spec', }))
keymap('n', '<leader>sq', function() Snacks.picker.qflist() end, opt({ desc = 'Snacks Quickfix List', }))
keymap('n', '<leader>sR', function() Snacks.picker.resume() end, opt({ desc = 'Snacks Resume', }))
keymap('n', '<leader>su', function() Snacks.picker.undo() end, opt({ desc = 'Snacks Undo History', }))
keymap('n', '<leader>uC', function() Snacks.picker.colorschemes() end, opt({ desc = 'Snacks Colorschemes', }))
-- LSP
keymap('n', 'gd', function() Snacks.picker.lsp_definitions() end, opt({ desc = 'Snacks Goto Definition', }))
keymap('n', 'gD', function() Snacks.picker.lsp_declarations() end, opt({ desc = 'Snacks Goto Declaration', }))
keymap('n', 'gr', function() Snacks.picker.lsp_references() end, opt({ nowait = true, desc = 'Snacks LSP References', }))
keymap('n', 'gI', function() Snacks.picker.lsp_implementations() end, opt({ desc = 'Snacks Goto Implementation', }))
keymap('n', 'gy', function() Snacks.picker.lsp_type_definitions() end, opt({ desc = 'Snacks Goto T[y]pe Definition', }))
keymap('n', '<leader>ss', function() Snacks.picker.lsp_symbols() end, opt({ desc = 'Snakcs LSP Symbols', }))
keymap('n', '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end,
    opt({ desc = 'Snakcs LSP Workspace Symbols', }))

-- [[ Trouble ]] --
keymap('n', "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opt({ desc = "Diagnostics (Trouble)", }))
keymap('n', "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    opt({ desc = "Buffer Diagnostics (Trouble)", }))
keymap('n', "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", opt({ desc = "Symbols (Trouble)", }))
keymap('n', "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    opt({ desc = "LSP Definitions / references / ... (Trouble)", }))
keymap('n', "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opt({ desc = "Location List (Trouble)", }))
keymap('n', "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", opt({ desc = "Quickfix List (Trouble)", }))
