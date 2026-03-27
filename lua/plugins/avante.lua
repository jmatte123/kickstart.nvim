return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false,
  opts = {
    auto_suggestions_provider = 'copilot',
    behavior = {
      auto_suggestions = true, -- Experimental stage
    },
    claude = {
      endpoint = 'https://api.anthropic.com',
      model = 'claude-3-7-sonnet-20250219',
      temperature = 0,
      max_tokens = 4096,
    },
  },
  build = 'make',
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    {
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      cmd = 'Copilot',
      event = 'InsertEnter',
      config = function()
        require('copilot').setup {
          panel = {
            enabled = false,
          },
          suggestion = {
            auto_trigger = true,
          },
        }
      end,
    },
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },

    --- The below is optional, make sure to setup it properly if you have lazy=true
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
        code = {
          enabled = false,
        },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
