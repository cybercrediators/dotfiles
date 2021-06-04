" neovim config
"
" base
set nocompatible
set smartindent
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set expandtab
set softtabstop=2
set shiftwidth=2

set mouse=a

" Plugins
"
" Auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

  Plug 'junegunn/vim-plug'
  Plug 'arcticicestudio/nord-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sts10/vim-pink-moon'
  Plug 'preservim/nerdtree'
  Plug 'preservim/tagbar'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'Raimondi/delimitMate'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'kchmck/vim-coffee-script'
  Plug 'pangloss/vim-javascript'
  Plug 'vim-crystal/vim-crystal'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-endwise'
  Plug 'thoughtbot/vim-rspec'
  Plug 'slim-template/vim-slim'
  Plug 'tpope/vim-bundler'
  Plug 'xavierd/clang_complete'
  Plug 'rust-lang/rust.vim'
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'leafgarland/typescript-vim'
  Plug 'lervag/vimtex'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  "Plug 'junegunn/fzf'
  "Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'dense-analysis/ale'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'norcalli/snippets.nvim'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'


call plug#end()

" Apply the colorscheme
if (has("termguicolors"))
  set termguicolors
endif
colorscheme pink-moon
set background=dark

" General settings
filetype plugin indent on
syntax on
set laststatus=2

" Airline settings
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%*

"" Nerdtree settings
nnoremap <C-g> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"autocmd BufWinEnter * silent NERDTreeMirror
let NERDTreeShowHidden=1
nmap <silent> <leader>t :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

" Tagbartoggle
nmap <F8> :TagbarToggle<CR>
nmap <silent> <leader>b :TagbarToggle<CR>

" Tab navigations
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Insert> :tabnew<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>

" Git settings
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" Tablemode settings
nnoremap <C-w>t :TableModeToggle<CR>
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

" ALE Settings
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <C-w>e :ALEToggle<CR>
nnoremap <C-w>d :ALEFindReferences<CR>
let g:ale_sign_error = '✘'
let g:ale_sign_warning = "▲"
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 1
highlight ALEWarning ctermbg=DarkMagenta

" Vim Latex Settings
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ag settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>

" Delimitmate settings
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" FZF settings
"let g:fzf_command_prefix = 'Fzf'
"nnoremap <silent> <leader>o :FzfFiles<CR>
"nnoremap <silent> <leader>O :FzfFiles!<CR>
"nmap <C-P> :FZF<CR>

" Tmux settings
let g:tmux_navigator_save_on_switch = 2
set encoding=utf-8 nobomb

" markdown preview
nmap <C-m> <Plug>MarkdownPreviewToggle

" Telescope

" LSP settings
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

lua << EOF
  local nvim_lsp = require('lspconfig')
  
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  
    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  
    -- Mappings.
    local opts = { noremap=true, silent=true }
  
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  
  end
  
  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { "pyright", "tsserver", "solargraph", "bashls", "angularls", "dockerls", "tsserver", "html", "java_language_server", "jsonls", "scry", "texlab", "gopls", "yamlls" }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
  end

  require'lspconfig'.vimls.setup {
    filetypes = { "vim" }
  }

  require'lspconfig'.ccls.setup {
    init_options = {
      compilationDatabaseDirectory = "build";
      index = {
        threads = 0;
      };
      clang = {
        excludeArgs = { "-frounding-math"} ;
      };
    }
  }

  require'lspconfig'.rust_analyzer.setup {
      on_attach=on_attach,
      settings = {
          ["rust-analyzer"] = {
              assist = {
                  importGranularity = "module",
                  importPrefix = "by_self",
              },
              cargo = {
                  loadOutDirsFromCheck = true
              },
              procMacro = {
                  enable = true
              },
          }
      }
  }

  require'lspconfig'.zeta_note.setup {
    cmd = { '~/lang-server/zeta-note-linux' },
    filetypes = { "markdown", "md" },
  }
EOF

" Autocompletion settings
lua << EOF
-- Compe Setup --
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    snippets_nvim = true;
    ultisnips = true;
    spell = true;
    treesitter = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

" Telescope settings
"nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>

" Treesitter settings
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
