--
local M = {
    'echasnovski/mini.indentscope',
    version = false,
    lazy = true,
    event = {"BufReadPre", "BufNewFile"}
}

M.opts = function()
  return {
    draw = {
      delay = 0,
      animation = require('mini.indentscope').gen_animation.none()
    },
    symbol = "│",
    options = { try_as_border = false, border = 'top' },
}
end

M.init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
end

M.config = function(_, opts)
  require("mini.indentscope").setup(opts)
end

return M
