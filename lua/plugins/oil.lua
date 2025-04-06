--
local M = {
  "stevearc/oil.nvim",
  lazy = true,
}

M.opts = {
  use_default_keymaps = false,
  keymaps = {
    ["-"] = "actions.parent",
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-c>"] = "actions.close",
    ["<leader>e"] = "actions.close",
    ["<C-r>"] = "actions.refresh",
    ["gs"] = "actions.change_sort",
    ["g."] = "actions.toggle_hidden",
  },
  default_file_explorer = true,
  view_options = {
    show_hidden = true,
  },
  columns = {
    "icon",
    "permissions",
  },
  float = {
    padding = 5,
  },
}

M.cmd = "Oil"

M.keys = {
  {
    "<leader>fe",
    function()
      require("oil").open_float(LazyVim.root())
    end,
    desc = "Explorer Oil (root dir)",
  },
  {
    "<leader>fE",
    "<cmd>Oil --float<cr>",
    desc = "Explorer Oil (cwd)",
  },
  {
    "<leader>e",
    function()
      require("oil").open_float(LazyVim.root())
    end,
    desc = "Explorer Oil (root dir)",
  },
  {
    "<leader>E",
    "<cmd>Oil --float<cr>",
    desc = "Explorer Oil (cwd)",
  },
}

return M
