--
local M = {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    tag = '0.1.5',
    lazy = true
}

M.opts = function()
    local actions = require("telescope.actions")

    return {
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-c>"] = actions.close
                },
                n = {
                    ["<C-c>"] = actions.close
                }
            }
        }
    }
end

M.cmd = "Telescope"

M.keys = { --   find
{
    "<leader>ff",
    "<cmd>Telescope find_files<cr>",
    desc = "find files (root dir)"
},
{
    "<leader>fg",
    "<cmd>Telescope live_grep<cr>",
    desc = "live grep (root dir)"
},
{
    "<leader>fF",
    function()
                require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })
    end,
    desc = "find files (crnt dir)"
},
{
    "<leader>fG",
    function()
                require('telescope.builtin').live_grep({ cwd = vim.fn.expand('%:p:h') })
    end,
    desc = "live grep (crnt dir)"
},

{
    "<leader>fr",
    "<cmd>Telescope oldfiles<cr>",
    desc = "recent"
}, {
    "<leader>bl",
    "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
    desc = "list buffers"
}, -- git
{
    "<leader>gf",
    "<cmd>Telescope git_files<cr>",
    desc = "files"
}, {
    "<leader>gc",
    "<cmd>Telescope git_commits<CR>",
    desc = "commits"
}, {
    "<leader>gs",
    "<cmd>Telescope git_status<CR>",
    desc = "status"
}}

return M
