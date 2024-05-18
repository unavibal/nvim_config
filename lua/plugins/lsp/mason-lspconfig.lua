M = {
    "williamboman/mason-lspconfig",
    dependencies = {'neovim/nvim-lspconfig'},
    event = {"BufReadPre", "BufNewFile"},
}

M.opts = function()
    local lsp_zero = require('lsp-zero')
    local lspconf = require("options.lsp")
    return {
        ensure_installed = lspconf.servers,
        handlers = {
        lsp_zero.default_setup,
        lspconf.handlers.unpack
      },
    }
end

return M
