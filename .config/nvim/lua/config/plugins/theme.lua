return {
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  "bluz71/vim-nightfly-colors",
  config = function()
    vim.g.airline_detect_paste = 1
    vim.g.airline_theme = 'luna'
    vim.g.airline_powerline_fonts = 1
    -- vim.g:airline#extensions#ale#enabled = 1
    -- let g:airline#extensions#hunks#non_zero_only = 1
    vim.g["airline#extensions#hunks#non_zero_only"] = 1
  end
}
