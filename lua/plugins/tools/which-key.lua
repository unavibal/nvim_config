--
local M = {
    "folke/which-key.nvim",
    event = "VeryLazy"
}

M.opts = {
    defaults = {
        ["<leader>f"] = {name = "+file/find"},
        ["<leader>g"] = {name = "+git"},
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>b"] = { name = "+buffers" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>k"] = { name = "+code/actions" },
        ["<leader>d"] = { name = "+debug" },
    }
}

M.init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
end

M.config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
end

return M
