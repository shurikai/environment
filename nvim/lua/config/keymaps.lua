-- Keymap function alias.
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

-- [[ Setup Leader Key ]] --
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- [[ Normal Mode ]] --

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize window with arrow keys --
keymap("n", "<M-k>", ":resize -2<CR>", opts)
keymap("n", "<M-j>", ":resize +2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Buffer navigation with Shift+h/l --
keymap("n", "<S-l>", ":bnext<CR>", opts) -- Shift-L for next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- Shift-H for prev buffer

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Close current buffer (force) --
keymap("n", "<S-q>", "<cmd>bdelete!<CR>", opts)

-- [[ Insert Mode ]] --
keymap("i", "jk", "<ESC>", opts)

-- [[ Visual Mode ]] --
-- Better visual paste --
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- [[ NvimTree ]] --
keymap("n", "<leader>e", "<CMD>Neotree toggle<CR>", opts)

-- [[ LSP Navigation - Diagnostics ]] --
vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { desc = "Go to next diagnostic line." })
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { desc = "Go to next diagnostic line." })

-- [[ JDTLS/LSP Bindings ]] --
vim.keymap.set("n", "<leader>co", "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = "Extract Variable" })
vim.keymap.set("n", "<leader>crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = "Extract Constant" })
vim.keymap.set(
    "v",
    "<leader>crv",
    "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
    { desc = "Extract Variable" }
)
vim.keymap.set(
    "v",
    "<leader>crc",
    "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
    { desc = "Extract Constant" }
)
vim.keymap.set(
    "v",
    "<leader>crm",
    "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
    { desc = "Extract Method" }
)
