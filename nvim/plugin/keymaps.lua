-- Keymap function alias.
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

-- [[ Setup Leader Key ]] --
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- [[ Normal Mode ]] --
-- Resize window with arrow keys --
keymap('n', '<M-k>', ':resize -2<CR>', opts)
keymap('n', '<M-j>', ':resize +2<CR>', opts)
keymap('n', '<M-h>', ':vertical resize -2<CR>', opts)
keymap('n', '<M-l>', ':vertical resize +2<CR>', opts)

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

-- Close current buffer (force) --
keymap('n', '<S-q>', '<cmd>bdelete!<CR>', opts)

-- [[ Insert Mode ]] --

-- [[ Visual Mode ]] --
-- Better visual paste --
keymap('v', 'p', '"_dP', opts)

-- Stay in indent mode --
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- [[ NeoTree ]] --
local ok, _ = pcall(require, 'neo-tree')
if ok then
  -- NeoTree needs a prefix, I think.
  -- vim.keymap.set("n", "<Leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
  -- vim.keymap.set("n", "<Leader>g", ":Neotree float git_status<CR>", { noremap = true, silent = true })
  -- vim.keymap.set("n", "<Leader>b", ":Neotree float buffers<CR>", { noremap = true, silent = true })
  -- vim.keymap.set("n", "|", ":Neotree toggle current reveal_force_cwd<CR>", { noremap = true, silent = true })
  vim.keymap.set('n', '|', ':Neotree toggle<CR>', { noremap = true, silent = true })
end

-- [[ LSP Navigation - Diagnostics ]] --
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic line.' })
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic line.' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover' })
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'LSP [G]o to [D]efinition' })
vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { desc = 'LSP [G]o to [D]eclaration' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, { desc = 'LSP [G]o to [R]eferences' })
vim.keymap.set({ 'n', 'v' }, '<leader>lc', vim.lsp.buf.code_action, { desc = '[L]SP [C]ode Actions' })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'LSP [F]ormat Buffer' })

-- [[ Neogit ]] --
vim.keymap.set('n', '<Leader>ng', ':Neogit<CR>', { desc = '[N]eo[g]it' })

-- [[ DAP ]] --
vim.keymap.set('n', '<Leader>db', '<CMD>DapToggleBreakpoint <CR>', { desc = '[D]ebugger Toggle [B]reakpoint' })
vim.keymap.set('n', '<Leader>dc', '<CMD>DapContinue <CR>', { desc = '[D]ebugger [C]ontinue' })

-- [[ Telescope ]] --
-- local builtin = require "telescope.builtin"
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
-- vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
-- vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind Current [W]ord" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
-- vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
-- vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
-- vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "[F]ind Recent Files" })
-- -- vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { desc = "[F]ind Recent [P]rojects" })
-- vim.keymap.set("n", "<leader>fb", builtin.git_branches, { desc = "[F]ind Git [B]ranches" })
-- vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
-- -- These are LSP-related Telescope commands, so they are <Leader>l rather than <Leader>f
-- vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "[L]SP [R]eferences" })
-- vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "[L]SP Document [S]ymbols" })
-- vim.keymap.set("n", "<leader>lw", builtin.lsp_document_symbols, { desc = "[L]SP [W]orkspace Symbols" })
--
-- vim.keymap.set("n", "<leader>/", function()
--     builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
--         winblend = 10,
--         previewer = false,
--     })
-- end, { desc = "[/] Fuzzily search current buffer" })
--
-- vim.keymap.set("n", "<leader>f/", function()
--     builtin.live_grep(require("telescope.themes").get_ivy {
--         grep_open_files = true,
--         prompt_title = "Live Grep in Open Files",
--     })
-- end, { desc = "[F]ind [/] in Open Files" })
--
-- vim.keymap.set("n", "<leader>fn", function()
--     builtin.find_files { cwd = vim.fn.stdpath "config" }
-- end, { desc = "[F]ind [N]eovim files" })

-- [[  ]] --
