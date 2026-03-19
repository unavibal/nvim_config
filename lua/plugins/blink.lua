--
local M = {
  "saghen/blink.cmp",
}

M.opts = function(_, opts)
  opts.keymap = {
    preset = "none",
    ["<A-y>"] = require("minuet").make_blink_map(),
    ["<¥>"] = require("minuet").make_blink_map(),

    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },

    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-j>"] = { "accept", "fallback" },
    ["<C-CR>"] = { "accept", "fallback" },
  }
  opts.sources = {
    -- Enable minuet for autocomplete
    default = { "lsp", "path", "buffer", "snippets", "minuet" },
    -- For manual completion only, remove 'minuet' from default
    providers = {
      minuet = {
        name = "minuet",
        module = "minuet.blink",
        async = true,
        -- Should match minuet.config.request_timeout * 1000,
        -- since minuet.config.request_timeout is in seconds
        timeout_ms = 3000,
        score_offset = 50, -- Gives minuet higher priority among suggestions
      },
    },
  }
  -- Recommended to avoid unnecessary request
  opts.completion = { trigger = { prefetch_on_insert = false } }
end
return M
