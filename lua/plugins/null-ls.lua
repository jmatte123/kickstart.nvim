return {
  'jose-elias-alvarez/null-ls.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  main = 'null-ls',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with {
          condition = function(utils)
            return utils.has_file { '.prettierrc.js' }
          end,
        },
      },
    }
  end,
}
