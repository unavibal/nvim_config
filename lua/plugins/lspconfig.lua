--
local M = {
  "neovim/nvim-lspconfig",
}

M.opts = function(_, opts)
  opts.diagnostics.virtual_text = false
  opts.diagnostics.virtual_lines = { current_line = true }
end

return M
