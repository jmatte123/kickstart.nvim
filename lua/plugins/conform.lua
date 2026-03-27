return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      rust = { 'rustfmt', lsp_format = 'fallback' },
      typescriptreact = { 'prettier', 'eslint_d', timeout = 5000 },
      javascriptreact = { 'prettier', 'eslint_d', timeout = 5000 },
      typescript = { 'prettier', 'eslint_d', timeout = 5000 },
      javascript = { 'prettier', 'eslint_d', timeout = 5000 },
      go = { 'gofumpt', 'goimports', 'golines' },
      html = { 'prettierd' },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
    },
    root_patterns = { 'package.json', '.eslintrc.js', '.git' },
  },
}
