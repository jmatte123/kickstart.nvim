return {
  'williamboman/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require 'mason'

    local mason_tool_installer = require 'mason-tool-installer'

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'black',
        'docker-compose-language-service',
        'dockerfile-language-server',
        'eslint-lsp',
        'go-debug-adapter',
        'gofumpt',
        'goimports',
        'golangci-lint',
        'golines',
        'gopls',
        'html-lsp',
        'htmlhint',
        'isort',
        'jq-lsp',
        'json-lsp',
        'jsonlint',
        'lua-language-server',
        'prettierd',
        'pylint',
        'python-lsp-server',
        'rust-analyzer',
        'stylua',
        'tailwindcss-language-server',
        'textlint',
        'typescript-language-server',
        'yaml-language-server',
        'yamlfmt',
      },
    }
  end,
}
