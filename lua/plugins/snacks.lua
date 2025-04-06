--
local M = {
  "folke/snacks.nvim",
}

-- disable snacks file explorer
M.keys = {
  { "<leader>fe", false },
  { "<leader>fE", false },
  { "<leader>e", false },
  { "<leader>E", false },
}

return M
