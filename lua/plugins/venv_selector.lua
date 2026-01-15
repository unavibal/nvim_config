local M = {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
  },
  ft = "python", -- Load when opening Python files
  keys = {
    { ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
  },
  opts = { -- this can be an empty lua table - just showing below for clarity.
    search = {
      my_search = {
        command = "fd /bin/python /raid/persistent_scratch/$USER/venvs/ --full-path -a -L",
      },
    }, -- if you add your own searches, they go here.
    options = {}, -- if you add plugin options, they go here.
  },
}

return M
