return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "okular"
    -- Vim Latex Settings
    -- let g:tex_flavor='latex'
    vim.g.tex_flavor = 'latex'
    -- let g:vimtex_view_general_viewer = 'okular'
    vim.g.vimtex_view_general_viewer = 'okular'
    -- let g:vimtex_quickfix_mode=0
    vim.g.vimtex_quickfix_mode = 0
    -- set conceallevel=1
    vim.opt.conceallevel = 1
    -- let g:tex_conceal='abdmg'
    vim.g.tex_conceal = 'abdmg'
  end
}
