return {
  'xiyaowong/transparent.nvim',
  config = function()
    require('transparent').clear_prefix 'NeoTree'
    require('transparent').setup {
      exclude_groups = {
        'StatusLine',
        'StatusLineNC',
      },
    }
  end,
}
