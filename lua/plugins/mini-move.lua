local M = {
  "nvim-mini/mini.move",
  event = "VeryLazy",
}

M.opts = { -- No need to copy this inside `setup()`. Will be used automatically.
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = "<ª>",
    right = "<¬>",
    down = "<º>",
    up = "<∆>",

    -- Move current line in Normal mode
    line_left = "<ª>",
    line_right = "<¬>",
    line_down = "<º>",
    line_up = "<∆>",
  },

  -- Options which control moving behavior
  options = {
    -- Automatically reindent selection during linewise vertical move
    reindent_linewise = true,
  },
}
return M
