--
M = {}

M.format = {
    ['ruff'] = {'python'},
}

M.servers = {
    -- python
    'ruff',
    'pyright',
    -- go
    'gopls',
    'golangci_lint_ls',
    -- docker
    'dockerls',
    'docker_compose_language_service',
    -- markdown
    'marksman',
}

M.handlers = {
    ruff = function()
        require('lspconfig').ruff.setup({
            on_attach = function(client, bufnr)
                client.server_capabilities.hoverProvider = false
            end
        })
    end,
}

return M
