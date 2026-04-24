local M = {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !

  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    -- for example
    provider = "mistral",
    -- Use a separate provider for inline suggestions
    auto_suggestions_provider = "codestral_complete",

    providers = {
      codestral = {
        __inherited_from = "openai",
        endpoint = "https://codestral.mistral.ai/v1",
        api_key_name = "MISTRAL_API_KEY",
        model = "codestral-latest",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 8192,
        },
      },
      codestral_complete = {
        __inherited_from = "openai",
        endpoint = "https://codestral.mistral.ai/v1",
        api_key_name = "MISTRAL_API_KEY",
        model = "codestral-latest",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.5,
          max_tokens = 1024,
        },
      },
      devstral_local = {
        __inherited_from = "openai",
        endpoint = "http://127.0.0.1:8001/v1",
        api_key_name = "MISTRAL_LOCAL_KEY",
        model = "unsloth/Devstral-Small-2-24B-Instruct-2512",
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 512,
        },
      },
      mistral = {
        __inherited_from = "openai",
        endpoint = "https://api.mistral.ai/v1",
        api_key_name = "MISTRAL_VIBE_KEY",
        model = "devstral-2512",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.3,
          max_tokens = 128000,
        },
      },
    },
    behaviour = {
      auto_suggestions = false, -- enable inline suggestions
      auto_approve_tool_permissions = false,
      confirmation_ui_style = "inline_buttons",
    },

    suggestion = {
      debounce = 600, -- ms to wait before triggering (avoid spamming the API)
      throttle = 600,
    },

    selector = {
      --- @alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
      --- @type avante.SelectorProvider
      provider = "native",
      -- Options override for custom providers
      provider_opts = {},
    },
    input = {
      provider = "snacks", -- or "dressing"
      provider_opts = {
        -- Additional snacks.input options
        title = "Avante Input",
        icon = " ",
      },
    },
    windows = {
      width = 35,
      input = {
        height = 12,
      },
    },
    highlights = {
      diff = {
        current = "AvanteDiffCurrent",
        incoming = "AvanteDiffIncoming",
      },
      suggestion = {
        text = { bg = "#ebdbb2" },
      },
    },
  },

  dependencies = {
    "ellisonleao/gruvbox.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    -- {
    --   -- support for image pasting
    --   "HakonHarnes/img-clip.nvim",
    --   event = "VeryLazy",
    --   opts = {
    --     -- recommended settings
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --       -- required for Windows users
    --       use_absolute_path = true,
    --     },
    --   },
    -- },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  config = function(_, opts)
    local avante = require("avante")
    avante.setup(opts)
    vim.api.nvim_set_hl(0, "AvanteToBeDeletedWOStrikethrough", { bg = "#f5d0b5" })
    -- Define custom highlight groups for avante diff
    vim.api.nvim_set_hl(0, "AvanteConflictCurrent", { bg = "#f5d0b5" })
    vim.api.nvim_set_hl(0, "AvanteConflictCurrentLabel", { bg = "#f0bc98" })
    vim.api.nvim_set_hl(0, "AvanteConflictIncoming", { bg = "#d8e8bc" })
    vim.api.nvim_set_hl(0, "AvanteConflictIncomingLabel", { bg = "#c4dcaa" })
  end,
}

return M
