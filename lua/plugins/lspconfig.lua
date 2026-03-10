--
local M = {
  "neovim/nvim-lspconfig",
}

-- local function get_stub_path()
--   local python
--   local ok, vs = pcall(require, "venv-selector")
--   if ok then
--     python = vs.python()
--   end
--   if not python or python == "" then
--     local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
--     python = venv and (venv .. "/bin/python") or (vim.fn.exepath("python3") ~= "" and "python3" or "python")
--   end
--   local site_packages = vim.fn.trim(vim.fn.system(python .. ' -c "import site; print(site.getsitepackages()[0])"'))
--   return site_packages .. "/stubs"
-- end

M.opts = function(_, opts)
  opts.diagnostics.virtual_text = false
  opts.diagnostics.virtual_lines = false
  -- opts.diagnostics.virtual_lines = { current_line = true }
  opts.servers = opts.servers or {}
  -- opts.servers.pyright = vim.tbl_deep_extend("keep", opts.servers.pyright or {}, {
  --   before_init = function(_, config)
  --     local stub_path = get_stub_path()
  --     vim.notify("pyright stubPath: " .. stub_path, vim.log.levels.INFO)
  --     config.settings = vim.tbl_deep_extend("keep", config.settings or {}, {
  --       python = { analysis = { stubPath = stub_path } },
  --     })
  --   end,
  -- })
  opts.servers.pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic", -- You can change this to "off", "basic", "standard", or "strict"
        },
      },
    },
  }
end

return M
