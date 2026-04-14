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
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       contrast = "soft",
  --       background = "light", -- sets vim.o.background = "light"
  --     })
  --     vim.o.background = "light"
  --     vim.cmd.colorscheme("gruvbox")
  --     vim.api.nvim_create_autocmd("ColorScheme", {
  --       pattern = "*",
  --       callback = function()
  --         -- Example overrides — adjust colors to taste
  --         vim.api.nvim_set_hl(0, "AvanteNormal", { bg = "#f2e5bc", fg = "#3c3836" })
  --         vim.api.nvim_set_hl(0, "AvanteEndOfBuffer", { bg = "#f2e5bc", fg = "#a89984" })
  --         vim.api.nvim_set_hl(0, "AvanteReversedNormal", { fg = "#f2e5bc", bg = "#3c3836" })
  --       end,
  --     })
  --   end,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
