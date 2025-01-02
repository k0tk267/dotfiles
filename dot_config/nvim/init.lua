-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-H>", 'copilot#Accept("<CR>")', { silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
-- LSP settings
vim.api.nvim_set_keymap('i', '<Tab>', [[coc#pum#visible() ? coc#pum#confirm() : "<Tab>"]], { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', [[coc#pum#visible() ? coc#pum#confirm() : "<Tab>"]], { noremap = true, expr = true, silent = true })
-- Ctrl + j for next completion item
vim.api.nvim_set_keymap('i', '<C-j>', [[coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"]], { noremap = true, expr = true, silent = true })
-- Ctrl + k for previous completion item
vim.api.nvim_set_keymap('i', '<C-k>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"]], { noremap = true, expr = true, silent = true })
-- options 
vim.opt.list = true
vim.opt.listchars:append("space:·") -- スペースをドットで表示
vim.opt.listchars:append("tab:→ ")  -- タブを矢印で表示

require "lazy_setup"
require "polish"
