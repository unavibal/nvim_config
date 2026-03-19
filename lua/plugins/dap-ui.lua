return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio" },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "x"} },
  },
  opts = {},
  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup(opts)
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close({})
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close({})
    -- end
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }

    -- Auto detect executable from CMakeLists.txt
    local function get_executable()
      local cmakelists = vim.fn.getcwd() .. "/CMakeLists.txt"
      for line in io.lines(cmakelists) do
        local project = line:match("^project%((.-)%)")
        if project then
          return vim.fn.getcwd() .. "/build/" .. project
        end
      end
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
    end

    -- C/C++ configurations
    dap.configurations.cpp = {
      {
        name = "Launch Built",
        type = "codelldb",
        request = "launch",
        program = get_executable,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp
  end,
}
