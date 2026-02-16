return {
  'echasnovski/mini.nvim',
  config = function()
    local minifiles = require 'mini.files'
    minifiles.setup {
      options = {
        use_as_default_explorer = false,
      },
    }
    vim.keymap.set('n', '\\', function()
      local _ = minifiles.close() or minifiles.open(vim.api.nvim_buf_get_name(0), false)
      vim.defer_fn(function() minifiles.reveal_cwd() end, 30)
    end, { desc = 'Open MiniFiles' })

    require('mini.surround').setup()

    require('mini.ai').setup { n_lines = 500 }

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function() return '%2l:%-2v' end
  end,
}
