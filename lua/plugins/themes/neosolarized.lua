return {
  'Tsuzat/NeoSolarized.nvim',
  lazy = false,
  priority = 1000,
  main = 'NeoSolarized',
  opts = {
    transparent = false
  },
  config = function(_, opts)
    require('NeoSolarized').setup(opts)
    vim.cmd.colorscheme 'NeoSolarized'
  end,
}

