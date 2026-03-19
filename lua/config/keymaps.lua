-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "º", "<Down>")
vim.keymap.set("i", "∆", "<Up>")
vim.keymap.set("i", "ª", "<Left>")
vim.keymap.set("i", "¬", "<Right>")
-- Disable Vim's built-in completion for C-n and C-p

local wk = require("which-key")

wk.add({
  { "<leader><Tab>$", "<cmd>tabnext<cr>", desc = "Next Tab" },
  { "<leader><Tab>ä", "<cmd>tabprevious<cr>", desc = "Previous Tab" },
  { "<leader>cO", "<cmd>OutlineFocus<cr>", desc = "Outline Focus" },
  { "<leader>cc", "<cmd>OutlineFocusCode<cr>", desc = "Code Focus" },
  { "<leader>cb", ":make<CR>", desc = "Build project" },
  { "<leader>cC", ":!cmake -DCMAKE_BUILD_TYPE=Debug -B build<CR>", desc = "Configure CMake" },
})

local dap = require("dap")

-- Function to set debug keymaps
local function set_debug_keymaps()
  vim.keymap.set("n", "<Up>", function()
    dap.step_out()
  end, { desc = "Step Out" })
  vim.keymap.set("n", "<Left>", function()
    dap.step_into()
  end, { desc = "Step Into" })
  vim.keymap.set("n", "<Right>", function()
    dap.step_over()
  end, { desc = "Step Over" })
  vim.keymap.set("n", "<Down>", function()
    dap.continue()
  end, { desc = "Continue" })
end

-- Function to restore default keymaps
local function restore_keymaps()
  local keymaps = { "<Up>", "<Down>", "<Left>", "<Right>" }
  for _, key in ipairs(keymaps) do
    local maps = vim.api.nvim_get_keymap("n")
    local exists = false
    for _, map in ipairs(maps) do
      if map.lhs == key then
        exists = true
        break
      end
    end
    if exists then
      vim.keymap.del("n", key)
    end
  end
end

-- Enable debug keymaps when DAP starts
dap.listeners.after.event_initialized["debug_keymaps"] = set_debug_keymaps
-- Restore keymaps when DAP terminates
dap.listeners.after.event_terminated["debug_keymaps"] = restore_keymaps
dap.listeners.after.event_exited["debug_keymaps"] = restore_keymaps
