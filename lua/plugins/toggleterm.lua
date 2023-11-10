return {
  'akinsho/toggleterm.nvim',
  main = 'toggleterm',
  opts = {
    open_mapping = '<C-\\>',
    shaing_factor = '0',
    direction = 'float',
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)
  end
}
