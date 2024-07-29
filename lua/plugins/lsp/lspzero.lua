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
        wk.add({
            {"<leader>k", group = "code/actions" },
            {"<leader>ka", function() vim.lsp.buf.code_action() end, desc = "Show code actions"},
            {"<leader>kr", function() vim.lsp.buf.references() end, desc = "List references"},
            {"<leader>kn", function() vim.lsp.buf.rename() end, desc = "Rename symbol"},
            {"gd", function() vim.lsp.buf.definition() end, desc = "Go to definition"},
            {"gD", function() vim.lsp.buf.declaration() end, desc = "Go to declaration"},
            {"K", function() vim.lsp.buf.hover() end, desc = "Show hover information"},
            {"<C-s>", function() vim.lsp.buf.signature_help() end, desc = "Show signature help", mode = "i"},
        })
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
