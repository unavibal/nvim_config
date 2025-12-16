return {
  {
    "catppuccin/nvim",
    lazy = true,
    opts = {},
    config = function()
      require("catppuccin").setup({
        term_colors = true,

        -- custom_highlights = function(colors)
        --   local u = require("catppuccin.utils.colors")
        --   return {
        --     CursorLine = {
        --       bg = u.vary_color(
        --         { latte = u.lighten(colors.mantle, 0.70, colors.base) },
        --         u.darken(colors.surface0, 0.2, colors.base)
        --       ),
        --     },
        --     LineNrAbove = {
        --       fg = colors.red,
        --     },
        --   }
        -- end,
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = { contrast = "soft" },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
