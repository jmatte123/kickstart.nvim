return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'NeoSolarized',
      component_separators = { left = '|', right = '|' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff' },
      lualine_c = {
        {
          'buffers',
          icons_enabled = false,
          buffers_color = {
            active = 'lualine_a_normal',
            inactive = 'lualine_b_inactive',
          },
        },
      },
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
