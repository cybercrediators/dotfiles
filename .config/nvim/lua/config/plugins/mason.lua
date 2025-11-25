return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "jsonls",
        "pyright",
        "solargraph",
        "bashls",
        "angularls",
        "dockerls",
        "ts_ls",
        "jsonls",
        "texlab",
        "gopls",
        "yamlls",
        "marksman",
        "cssls",
        "vimls",
        "clangd",
        "rust_analyzer",
      },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
