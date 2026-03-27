return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  opts = function()
    local ts = require 'ts_context_commentstring.integrations.comment_nvim'

    return {
      pre_hook = ts.create_pre_hook(),
    }
  end,
}
