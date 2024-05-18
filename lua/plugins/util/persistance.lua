--
local M = {
    "folke/persistence.nvim",
    event = {"BufReadPre", "BufNewFile"}
  }

  M.opts = { options = vim.opt.sessionoptions:get() }

  M.keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    }

    return M