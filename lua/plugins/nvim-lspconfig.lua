local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  local format_is_enabled = true
  vim.api.nvim_create_user_command('ToggleFormatting', function()
    format_is_enabled = not format_is_enabled
    print('Setting autoformatting to: ' .. tostring(format_is_enabled))
  end, {})

  if client.name == 'jsonls' then
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.opt.foldcolumn = '0'
    vim.opt.foldtext = 'v:folddashes.substitute(getline(v:foldstart), "/\\*\\|*/\\|{{{\\d\\=","", "g")'
    vim.opt.foldlevel = 3
    vim.opt.foldlevels = 3

    vim.op_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    group = vim.api.nvim_create_augroup('lsp-format-' .. client.name, { clear = true }),
    callback = function()
      if not format_is_enabled then
        return
      end
      require('conform').format { bufnr = bufnr }
    end,
  })
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',

    'rust-lang/rust.vim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    local servers = {
      docker_compose_language_service = {},
      dockerls = {},
      eslint = { packageManager = 'npm' },
      jsonls = {},
      kotlin_language_server = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      pylsp = {},
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
          },
        },
      },
      rust_analyzer = {
        settings = {
          rustfmt = {
            enable = true, -- Enable rustfmt integration
          },
          diagnostics = {
            enable = true,
          },
        },
      },
      tailwindcss = {},
      yamlls = {},
    }

    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
      ['eslint'] = function()
        require('lspconfig').eslint.setup {
          settings = {
            packageManager = 'npm',
          },
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              command = 'EslintFixAll',
            })
          end,
        }
      end,
    }
  end,
}
