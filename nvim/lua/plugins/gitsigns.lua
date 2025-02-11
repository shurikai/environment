return {
  'lewis6991/gitsigns.nvim',
  event = 'BufEnter',
  cmd = 'Gitsigns',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Gitsigns Navigate Next' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Gitsigns Navigate Previous' })

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Gitsigns Stage Hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Gitsigns Reset Hunk' })
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end)
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end)
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Gitsigns Stage Buffer' })
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Gitsigns Undo Stage Hunk' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Gitsigns Reset Buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Gitsigns Preview Hunk' })
      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, { desc = 'Gitsigns Blame Line' })
      map('n', '<leader>htb', gitsigns.toggle_current_line_blame, { desc = 'Gitsigns Toggle Current Line Blame' })
      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Gitsigns Diff This' })
      map('n', '<leader>hD', function()
        gitsigns.diffthis '~'
      end, { desc = 'Gitsigns Diff This With ~' })
      map('n', '<leader>htd', gitsigns.toggle_deleted, { desc = 'Gitsigns Toggle Deleted' })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Gitsigns Select Hunk' })
    end,
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = 'rounded',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text_pos = 'right_align',
      ignore_whitespace = true,
    },
  },
}
