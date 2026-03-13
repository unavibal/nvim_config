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
    provider = "codestral",
    -- Use a separate provider for inline suggestions
    suggestion_provider = "codestral_fim",

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
      -- FIM provider (for inline suggestions)
      codestral_fim = {
        endpoint = "https://codestral.mistral.ai/v1/fim/completions",
        api_key_name = "MISTRAL_API_KEY",
        model = "codestral-latest",
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint,
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name),
            },
            body = vim.json.encode({
              model = opts.model,
              prompt = code_opts.code_content,
              suffix = code_opts.suffix or "",
              max_tokens = 256,
              temperature = 0,
            }),
          }
        end,
        parse_response = function(data_stream, _, opts)
          local ok, json = pcall(vim.json.decode, data_stream)
          if not ok then
            return
          end
          local text = vim.tbl_get(json, "choices", 1, "message", "content") or vim.tbl_get(json, "choices", 1, "text")
          if text then
            opts.on_chunk(text)
          end
          if vim.tbl_get(json, "choices", 1, "finish_reason") then
            opts.on_complete(nil)
          end
        end,
      },
    },
    behaviour = {
      auto_suggestions = false, -- enable inline suggestions
    },

    suggestion = {
      debounce = 600, -- ms to wait before triggering (avoid spamming the API)
      throttle = 600,
    },

    selector = {
      --- @alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
      --- @type avante.SelectorProvider
      provider = "fzf",
      -- Options override for custom providers
      provider_opts = {},
    },
    input = {
      provider = "snacks", -- or "dressing"
    },
  },
  dependencies = {
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
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

return M
