M = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        "folke/which-key.nvim",
    },
    -- lazy = true,
}

M.opts = {
    keymaps = {
        {"<leader>k", group = "code/actions" },
        {"<leader>ka", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Show code actions"},
        {"<leader>kr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Show references"},
        {'<leader>ks', '<cmd>lua vim.lsp.buf.signature_help()<cr>', desc="show signature"},
        {"<leader>kn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol"},
        {'<leader>kf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', desc="Format document"},
        {'K', '<cmd>lua vim.lsp.buf.hover()<cr>', desc="Hover"},
        {'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc="Go to definition"},
        {'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc="Go to declaration"},
        {'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', desc="Go to implementation"},
        {"<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Show signature", mode = "i"},
    }
}

M.config = function(_, opts)
    local lsp_zero = require('lsp-zero')
    local icons = require("options.icons")

    lsp_zero.set_sign_icons({
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        info = icons.diagnostics.Info,
        hint = icons.diagnostics.Hint,
    })

    local lsp_attach = function(client, bufnr)
        local wk = require("which-key")
        wk.add(opts.keymaps)
    end

    lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        sign_text = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
        },
    })
end

return M
