--
local M = {
    'lewis6991/gitsigns.nvim',
    version = 'v0.7',
    lazy = true,
    event = {"BufReadPre", "BufNewFile"},
}

M.opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map('n', '<leader>gr', gs.reset_hunk, 'hunk reset')
      map('n', '<leader>gp', gs.preview_hunk_inline, 'hunk preview')
      map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, 'hunk stage')
      map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, 'hunk reset')
      map('n', '<leader>gb', gs.toggle_current_line_blame, 'toggle line blame')
      map('n', '<leader>gd', gs.toggle_deleted, 'toggle deleted')
    end,
  }


M.cmd = "Gitsigns"

return M
