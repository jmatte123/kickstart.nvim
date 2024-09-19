return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'NeoSolarized',
      component_separators = { left = '|', right = '|' },
      disabled_filetypes = {
        statusline = { 'Avante', 'AvanteInput' },
        winbar = { 'Avante', 'AvanteInput' },
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'diff' },
      lualine_c = { 'branch' },
      lualine_x = { 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_x = { '%{&ft == "toggleterm" ? "terminal (".b:toggle_number.")" : ""}' },
    },
    winbar = {
      lualine_a = { { 'filename', path = 1 } },
      lualine_x = { 'diagnostics' },
    },
    inactive_winbar = {
      lualine_b = { { 'filename', path = 1 } },
      lualine_x = { 'diagnostics' },
    },
    extensions = {
      'fugitive',
      'lazy',
      'mason',
      'nvim-tree',
      'toggleterm',
      'trouble',
    },
  },
}
