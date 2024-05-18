--
local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true
}

M.opts = {}

M.config = function(_, opts)
  require("harpoon").setup(opts)
  vim.keymap.set("n", "<C-c>", function() require("harpoon").ui:close_menu(true) end)
end

M.keys = {
{
    "<leader>hl",
    function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
    desc = "list harpoon"
},
{
    "<leader>ha",
    function() require("harpoon"):list():add() end,
    desc = "add current file"
},
{
    "<leader>h1",
    function() require("harpoon"):list():select(1) end,
    desc = "select harpoon 1"
},
{
    "<leader>h2",
    function() require("harpoon"):list():select(2) end,
    desc = "select harpoon 2"
},
{
    "<leader>h3",
    function() require("harpoon"):list():select(3) end,
    desc = "select harpoon 3"
},
{
    "<leader>h4",
    function() require("harpoon"):list():select(4) end,
    desc = "select harpoon 4"
},
{
    "<leader>hp",
    function() require("harpoon"):list():prev() end,
    desc = "previous harpoon"
},
{
    "<leader>hn",
    function() require("harpoon"):list():next() end,
    desc = "next harpoon"
},
}


return M
