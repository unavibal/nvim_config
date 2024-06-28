--
local M = {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VimEnter",
    priority = 1000,
}

M.opts = {
    show_end_of_buffer = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
    },
    integrations = {
        dap_ui = true,
        dap = true,
        cmp = true,
        dashboard = true,
        gitsigns = true,
        treesitter = true,
        mason = true,
        which_key = true,
        harpoon = true,
        mini = {
            enabled = true,
            indentscope_color = "rosewater",
        },
        telescope = {
            enabled = true,
        }
    },
    highlight_overrides = {
        all = function(colors)
            return {
                CursorLineNr = { fg = colors.rosewater },
                NormalFloat = { bg = colors.none },
                FloatBorder = { bg = colors.none },
                WhichKeyFloat = { bg = colors.mantle },
            }
        end,
    },
}

M.config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin-frappe")
end

return M
