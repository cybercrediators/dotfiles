return {
  'dhruvasagar/vim-table-mode',
  config = function()

  -- Tablemode settings
  -- let g:table_mode_disable_tableize_mappings = 1
  vim.g.table_mode_disable_tableize_mappings = 1
  -- let g:table_mode_disable_mappings = 1
  vim.g.table_mode_disable_mappings = 1
  -- nnoremap <C-w>t :TableModeToggle<CR>
  vim.keymap.set('n', '<C-w>t', ":TableModeToggle<CR>", { desc = "Toggle Table mode", noremap = true })
  vim.cmd([[
    function! s:isAtStartOfLine(mapping)
      let text_before_cursor = getline('.')[0 : col('.')-1]
      let mapping_pattern = '\V' . escape(a:mapping, '\')
      let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
      return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
    endfunction
    inoreabbrev <expr> <bar><bar>
              \ <SID>isAtStartOfLine('\|\|') ?
              \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
    inoreabbrev <expr> __
              \ <SID>isAtStartOfLine('__') ?
              \ '<c-o>:silent! TableModeDisable<cr>' : '__'

  ]])
  
  end
}
