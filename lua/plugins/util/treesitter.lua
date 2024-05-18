--
local M = {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ":TSUpdate",
    lazy = true,
    event = {"BufReadPre", "BufNewFile"}
}

M.opts = {
    ensure_installed = "all",
    sync_install = false,
    auto_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = false
    },
  }

M.init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
end

M.config = function(_, opts)
  require("nvim-treesitter.configs").setup(opts)
end

return M
