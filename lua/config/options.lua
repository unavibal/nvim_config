-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

--------------------------------------------------------------------------------
-- general
--------------------------------------------------------------------------------
opt.clipboard = "" -- unnamed clipboard

--------------------------------------------------------------------------------
-- ui
--------------------------------------------------------------------------------
opt.relativenumber = true -- relative linenumbers
opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20" -- set cursor to block
