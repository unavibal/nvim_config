--
local M = {
  "nvim-lualine/lualine.nvim",
}

M.opts = function(_, opts)
  opts.sections.lualine_a =
    { {
      "mode",
      fmt = function(res)
        return "" .. " " .. res:sub(1, 1)
      end,
    } }
end

return M
