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
            vimgrep_arguments = {
                "rg",
                "--follow",        -- Follow symbolic links
                "--hidden",        -- Search for hidden files
                "--no-heading",    -- Don't group matches by each file
                "--with-filename", -- Print the file path with the matched lines
                "--line-number",   -- Show line numbers
                "--column",        -- Show column numbers
                "--smart-case",    -- Smart case search
                "--no-ignore-vcs", -- search in folders ignored by gitignore

                -- Exclude some patterns from search
                "--glob=!**/.git/*",
                "--glob=!**/.idea/*",
                "--glob=!**/.vscode/*",
                "--glob=!**/build/*",
                "--glob=!**/dist/*",
                "--glob=!**/yarn.lock",
                "--glob=!**/package-lock.json",
            },
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
    "<cmd>Telescope find_files no_ignore=true<cr>",
    desc = "find files"
},
{
    "<leader>fh",
    "<cmd>Telescope find_files no_ignore=true hidden=true<cr>",
    desc = "find files (hidden)"
},
{
    "<leader>fg",
    "<cmd>Telescope live_grep<cr>",
    desc = "live grep"
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
