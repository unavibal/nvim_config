--
local M = {
  "trixnz/sops.nvim",
  lazy = true,
  event = "BufReadPre *.sops.yaml",
}

return M
