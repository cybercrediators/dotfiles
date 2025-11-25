return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  -- markdown preview
  -- nmap <Leader>m <Plug>MarkdownPreviewToggle
  vim.keymap.set('n', '<Leader>m', "<Plug>MarkdownPreviewToggle", { desc = "Start Markdown preview" })

}
