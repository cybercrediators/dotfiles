vim.opt.compatible = false
vim.opt.smartindent = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.ruler = true
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.laststatus = 2

vim.opt.mouse = a
vim.opt.clipboard:append('unnamedplus')

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.statusline:append("%#warningmsg#")
vim.opt.statusline:append("%*")

--- Lazy.nvim setting
-- vim.g.mapleader = '\'
-- vim.g.maplocalleader = ' '
vim.g["airline#extensions#tabline#enabled"] = 1
vim.cmd [[colorscheme nightfly]]
vim.cmd [[
  filetype plugin indent on
  syntax on
]]

-- ag settings -> the_silver_searcher
if vim.fn.executable('ag') == 1 then
  vim.g.ackprg = 'ag --vimgrep'
end
