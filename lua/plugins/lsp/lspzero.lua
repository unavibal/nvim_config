M = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {"folke/which-key.nvim", {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    }},
    lazy = true,
}

M.opts = {}

M.config = function(_, opts)
    local lsp_zero = require('lsp-zero')

    -- sign column icons
    local icons = require("options.icons")
    lsp_zero.set_sign_icons({
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        info = icons.diagnostics.Info,
        hint = icons.diagnostics.Hint,
    })

    lsp_zero.extend_lspconfig()
    lsp_zero.on_attach(function(client, bufnr)

        -- keymaps
        local wk = require("which-key")
        wk.register({
            ["<leader>k"]  = { name = "+code/actions" },
            ["<leader>ka"] = { function() vim.lsp.buf.code_action() end, "Show code actions"},
            ["<leader>kr"] = { function() vim.lsp.buf.references() end, "List references"},
            ["<leader>kn"] = { function() vim.lsp.buf.rename() end, "Rename symbol"},
            ["gd"]= { function() vim.lsp.buf.definition() end, "Go to definition"},
            ["gD"]= { function() vim.lsp.buf.declaration() end, "Go to declaration"},
            ["K"] = { function() vim.lsp.buf.hover() end, "Show hover information"},
        })
        wk.register({
            ["<C-s>"] = {function() vim.lsp.buf.signature_help() end, "Show signature help"},
        }, {mode = "i"})
    end)

    -- formatting
    local lspconf = require("options.lsp")
    lsp_zero.format_on_save({
        format_opts = {
            async = false,
            timeout_ms = 10000,
        },
        servers = lspconf.format
    })
end

return M
