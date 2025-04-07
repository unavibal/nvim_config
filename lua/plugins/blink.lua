--
local M = {
  "saghen/blink.cmp",
}

M.opts = function(_, opts)
  opts.keymap = {
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
  }
end

return M
