--
local M = {
    "folke/which-key.nvim",
    dependencies = {'echasnovski/mini.icons'},
    event = "VeryLazy",
}

M.opts = {
    defaults = {
    { "<leader>b", group = "buffers" },
    { "<leader>d", group = "debug" },
    { "<leader>f", group = "file/find" },
    { "<leader>g", group = "git" },
    { "<leader>h", group = "harpoon" },
    { "<leader>k", group = "code/actions" },
    { "<leader>q", group = "quit/session" },
    }
}

M.init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
end

M.config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(opts.defaults)
end

return M
