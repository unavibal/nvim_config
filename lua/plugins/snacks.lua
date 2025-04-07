--
local M = {
  "folke/snacks.nvim",
}

M.opts = function(_, opts)
  opts.picker.sources = {
    files = {
      hidden = true,
      ignored = true,
      exclude = { "node_modules", ".git" },
    },
  }
end

-- disable snacks file explorer
M.keys = {
  { "<leader>fe", false },
  { "<leader>fE", false },
  { "<leader>e", false },
  { "<leader>E", false },
}

return M
