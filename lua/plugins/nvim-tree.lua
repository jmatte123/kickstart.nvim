return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    renderer = {
      group_empty = true,
    },
  },
  config = function(_, opts)
    require('nvim-tree').setup(opts)
    vim.api.nvim_set_keymap('n', '<leader>tt', ':NvimTreeToggle<cr>', { silent = true, noremap = true, desc = '[T]ree [T]oggle' })
    vim.api.nvim_set_keymap('n', '<leader>tf', ':NvimTreeFindFile<cr>', { silent = true, noremap = true, desc = '[T]ree [F]ind File' })
  end,
}
