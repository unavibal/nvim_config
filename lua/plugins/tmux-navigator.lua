--
local M = {
  "christoomey/vim-tmux-navigator",
  lazy = true,
}

M.cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" }

M.keys = {
  { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", mode = "n" },
  { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", mode = "n" },
  { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", mode = "n" },
  { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", mode = "n" },
}

return M
