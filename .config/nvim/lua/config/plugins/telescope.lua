return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' },
    defaults = {
      file_ignore_patterns = {
        "node_modules/.*",
        "blackbox",
        ".git/.*"
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    },
    config = function()
      pcall(require('telescope').load_extension, 'fzf')
      -- nnoremap <leader>ff <cmd>Telescope find_files<cr>
      vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { desc = "Find files with telescope", noremap = true })
      -- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", { desc = "Grep with telescope", noremap = true })
      -- nnoremap <leader>fb <cmd>Telescope buffers<cr>
      vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", { desc = "Search buffers with telescope", noremap = true })
      -- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
      vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", { desc = "Search help tags with telescope", noremap = true })
      -- nnoremap <leader>fl <cmd>Telescope git_files<cr>
      vim.keymap.set('n', '<leader>fl', "<cmd>Telescope git_files<cr>", { desc = "Search git_files with telescope", noremap = true })
      -- nnoremap <leader>ft <cmd>Telescope treesitter<cr>
      vim.keymap.set('n', '<leader>ft', "<cmd>Telescope treesitter<cr>", { desc = "Search treesitter with telescope", noremap = true })

    end
  }
}
