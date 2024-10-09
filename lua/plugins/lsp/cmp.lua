M = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
    },
    event = 'InsertEnter',
}

M.opts = function()
    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    return {
        sources = {
            {name = 'nvim_lsp'},
            {name = 'path'},
            {name = 'buffer', keyword_length = 3},
        },
        formatting = require('lsp-zero').cmp_format(),
        mapping = cmp.mapping.preset.insert({
            ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
        })
    }
end

return M
