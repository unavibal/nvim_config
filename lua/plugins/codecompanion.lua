local M = {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

M.opts = {
  interactions = {
    chat = {
      adapter = "mistral",
      tools = {
        opts = {
          auto_submit_errors = true,
        },
      },
    },
    inline = {
      adapter = "mistral",
    },
  },
  adapters = {
    http = {
      mistral = function()
        return require("codecompanion.adapters").extend("mistral", {
          env = {
            api_key = "vHWdCOebtRXGUXE7qcEl9liDiHFkXY81",
            url = "https://codestral.mistral.ai",
          },
          schema = {
            model = {
              default = "codestral-latest",
            },
          },
        })
      end,
    },
  },
  display = {
    chat = {
      window = {
        width = 0.15,
      },
    },
  },
}

return M
