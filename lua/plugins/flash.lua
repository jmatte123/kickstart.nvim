return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  --- @type Flash.Config
  opts = {},
  config = function()
    require('flash').setup {}
    vim.keymap.set('n', '<leader>ff', function()
      require('flash').jump()
    end, { desc = 'Flash Toggle' })
    vim.keymap.set('n', '<leader>fF', function()
      require('flash').treesitter()
    end, { desc = 'Flash Treesitter' })
    vim.keymap.set('n', '<leader>fr', function()
      require('flash').remote()
    end, { desc = 'Flash Remote' })
    vim.keymap.set('n', '<leader>fR', function()
      require('flash').treesitter_search()
    end, { desc = 'Flash Treesitter Search' })
    vim.keymap.set('c', 'c-s', function()
      require('flash').toggle()
    end, { desc = 'Toggle Flash Search' })
  end,
}
