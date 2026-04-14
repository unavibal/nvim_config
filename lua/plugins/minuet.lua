return {
  "milanglacier/minuet-ai.nvim",
  opts = {
    blink = {
      enable_auto_complete = false,
    },
    provider = "codestral",
    provider_options = {
      codestral = {
        model = "codestral-latest",
        end_point = "https://codestral.mistral.ai/v1/fim/completions",
        api_key = "CODESTRAL_API_KEY",
        stream = true,
        -- template = {
        --   prompt = "See [Prompt Section for default value]",
        --   suffix = "See [Prompt Section for default value]",
        -- },
        optional = {
          stop = { "\n\n" }, -- the identifier to stop the completion generation
          max_tokens = 256,
        },
      },
    },
  },
}
