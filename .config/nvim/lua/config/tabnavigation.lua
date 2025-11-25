-- Tab navigations
-- nnoremap <C-Left> :tabprevious<CR>
vim.keymap.set('n', '<C-Left>', ':tabprevious<CR>', { desc = "Previous Tab", noremap = true })
-- nnoremap <C-tab>   :tabnext<CR>
vim.keymap.set('n', '<C-tab>', ':tabnext<CR>', { desc = "Next Tab", noremap = true })
-- nnoremap <C-Right> :tabnext<CR>
vim.keymap.set('n', '<C-Right>', ':tabnext<CR>', { desc = "Next Tab", noremap = true })
-- nnoremap <C-Insert> :tabnew<CR>
vim.keymap.set('n', '<C-Insert>', ':tabnew<CR>', { desc = "New Tab", noremap = true })
-- nnoremap <C-S-tab> :tabprevious<CR>
vim.keymap.set('n', '<C-S-tab>', ':tabprevious<CR>', { desc = "Previous Tab", noremap = true })
-- nnoremap <C-t>     :tabnew<CR>
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', { desc = "Next Tab", noremap = true })
-- inoremap <C-S-tab> <Esc>:tabprevious<CR>i
vim.keymap.set('i', '<C-S-tab>', '<Esc>:tabprevious<CR>i', { desc = "Next Tab", noremap = true })
-- inoremap <C-tab>   <Esc>:tabnext<CR>i
vim.keymap.set('i', '<C-tab>', '<Esc>:tabnext<CR>i', { desc = "Next Tab", noremap = true })
-- inoremap <C-t>     <Esc>:tabnew<CR>
vim.keymap.set('i', '<C-t>', '<Esc>:tabnew<CR>', { desc = "Next Tab", noremap = true })
-- nnoremap <C-Delete> :tabclose<CR>
vim.keymap.set('n', '<C-Delete>', ':tabclose<CR>', { desc = "Next Tab", noremap = true })

-- Close buffer
-- nnoremap <leader>q :bdelete<CR>
vim.keymap.set('n', '<leader>q', ':bdelete<CR>', { desc = "Next Tab", noremap = true })
-- nnoremap <leader>n :bnext<CR>
vim.keymap.set('n', '<leader>n', ':bnext<CR>', { desc = "Next Tab", noremap = true })
-- nnoremap <leader>p :bprevious<CR>
vim.keymap.set('n', '<leader>p', ':bprevious<CR>', { desc = "Next Tab", noremap = true })
