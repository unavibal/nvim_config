--
M = {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {"williamboman/mason.nvim"},
    lazy = true,
}

M.opts = function()
    local dapconf = require("options.dap")
    return {
        automatic_installation = true,
        ensure_installed = dapconf.adapters,
        handlers = dapconf.handlers,
    }
end

M.config = function(_, opts)
     require("mason-nvim-dap").setup(opts)
end

M.cmd = { "DapInstall", "DapUninstall" }

return M
