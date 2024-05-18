--
local M = {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    lazy = true,
    event = {"BufReadPre", "BufNewFile"}
}

M.opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
}

return M
