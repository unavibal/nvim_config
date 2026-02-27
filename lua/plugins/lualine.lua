--
local M = {
  "nvim-lualine/lualine.nvim",
}

M.opts = function(_, opts)
  opts.sections.lualine_a = {
    {
      "mode",
      fmt = function(res)
        return "" .. " " .. res:sub(1, 1)
      end,
    },
    {
      "windows",
      show_modified_status = true,
    },
  }
end

return M
