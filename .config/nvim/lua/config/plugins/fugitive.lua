return {
  'airblade/vim-gitgutter',
  'tpope/vim-fugitive',
  opts = {},
  config = function()
    -- Git settings
    -- hi clear SignColumn
    vim.cmd([[hi clear signColumn]])
    -- function! GitStatus()
    --   let [a,m,r] = GitGutterGetHunkSummary()
    --   return printf('+%d ~%d -%d', a, m, r)
    -- endfunction
    vim.cmd([[
      function! GitStatus()
        let [a,m,r] = GitGutterGetHunkSummary()
        return printf('+%d ~%d -%d', a, m, r)
      endfunction
    ]])
    -- set statusline+=%{GitStatus()}
    vim.opt.statusline:append('%{GitStatus()}')
  end
}
