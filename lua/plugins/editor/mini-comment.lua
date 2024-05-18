--
local M = {
    'echasnovski/mini.comment',
    version = false,
    lazy = true,
    event = {"BufReadPre", "BufNewFile"}
}

M.opts = {
    mappings = {
        comment = '<leader>c',
        comment_line = '<leader>c',
        comment_visual = '<leader>c'
    }
}

return M
