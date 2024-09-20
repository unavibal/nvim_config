--
local g = vim.g                 -- Global variables
local opt = vim.opt             -- Set options

--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------
g.mapleader = ' '
opt.mouse = 'a'                 -- Enable mouse support
opt.swapfile = false            -- Don't use swapfile

--------------------------------------------------------------------------------
-- Neovim UI
--------------------------------------------------------------------------------
opt.number = true               -- Show line number
opt.relativenumber = true       -- relative linenumbers
opt.cursorline = true           -- enable cursorline
opt.cursorlineopt = 'both'      -- highlight group for line number
opt.showmatch = true            -- Highlight matching parenthesis
opt.foldmethod = 'marker'       -- Enable folding (default 'foldmarker')
opt.ignorecase = true           -- Ignore case letters when search
opt.smartcase = true            -- Ignore lowercase for the whole pattern
opt.linebreak = true            -- Wrap on word boundary
opt.termguicolors = true        -- Enable 24-bit RGB colors
opt.laststatus= 3               -- Set global statusline
opt.scrolloff = 8               -- have at least 8 rows at bottom
opt.colorcolumn = "88"          -- colorcolumn after 88 chars

--------------------------------------------------------------------------------
-- Tabs, indent
--------------------------------------------------------------------------------
opt.expandtab = true            -- Use spaces instead of tabs
opt.shiftwidth = 4              -- Shift 4 spaces when tab
opt.tabstop = 4                 -- 1 tab == 4 spaces
opt.smartindent = true          -- Autoindent new lines

--------------------------------------------------------------------------------
-- split windows
--------------------------------------------------------------------------------
opt.splitright = true           -- split vertical window to the right
opt.splitbelow = true           -- split horizontal window to the bottom

--------------------------------------------------------------------------------
-- Memory, CPU
--------------------------------------------------------------------------------
opt.hidden = true               -- Enable background buffers
opt.history = 100               -- Remember N lines in history
opt.lazyredraw = true           -- Faster scrolling
opt.synmaxcol = 500             -- Max column for syntax highlight
opt.updatetime = 750            -- ms to wait for trigger an event
