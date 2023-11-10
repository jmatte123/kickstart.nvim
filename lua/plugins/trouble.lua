return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function(_, opts)
    require('trouble').setup(opts)
    vim.keymap.set('n', '<leader>xx', function() require('trouble').toggle() end, { desc = 'trouble toggle' })
    vim.keymap.set('n', '<leader>xw', function() require('trouble').toggle('workspace_diagnostics') end, { desc = 'trouble toggle workspace diagnostics' })
    vim.keymap.set('n', '<leader>xd', function() require('trouble').toggle('document_diagnostics') end, { desc = 'trouble toggle document diagnostics' })
    vim.keymap.set('n', '<leader>xq', function() require('trouble').toggle('quickfix') end, { desc = 'trouble toggle quickfix' })
    vim.keymap.set('n', '<leader>xl', function() require('trouble').toggle('loclist') end, { desc = 'trouble toggle loclist' })
    vim.keymap.set('n', 'gR', function() require('trouble').toggle('lsp_references') end, { desc = 'trouble toggle lsp references' })
  end
}
