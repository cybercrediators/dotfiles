return {
  'preservim/nerdtree',
  opts = {},
  config = function()
    -- nnoremap <leader>t :NERDTreeFind<CR>
    vim.keymap.set('n', '<leader>t', ":NERDTreeFind<CR>", { desc = "Open nerdtree at position", noremap = true })
    -- nnoremap <C-g> :NERDTreeToggle<CR>
    vim.keymap.set('n', '<C-g>', ":NERDTreeToggle<CR>", { desc = "Open nerdtree", noremap = true })
    
    vim.cmd([[
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
          \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
      autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    ]])

    -- autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    -- vim.api.nvim_create_autocmd("BufEnter", {
  	--   pattern = "*",
  	--   callback = function()
    --   	  if vim.fn.tabpagenr("$") == 1 and vim.fn.winnr("$") == 1 and vim.b.NERDTree and vim.cmd.call('b:NERDTree.isTabTree()') then
    --     	    vim.cmd("quit")
    --   	  end
  	--   end,
  	--   nested = true 
    -- })
    -- "autocmd BufWinEnter * silent NERDTreeMirror
    -- let NERDTreeShowHidden=1
    vim.g.NERDTreeShowHidden=1
    -- let g:nerdtree_tabs_open_on_console_startup = 0
    vim.g.nerdtree_tabs_open_on_console_startup = 1
  end
}
