return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
      }

      vim.keymap.set('n', '<leader>tt', function()
        local Terminal = require('toggleterm.terminal').Terminal
        if Terminal and Terminal:is_open() then
          vim.cmd 'ToggleTerm'
          return
        end
        local file = vim.api.nvim_buf_get_name(0)
        local dir = file ~= '' and vim.fn.fnamemodify(file, ':p:h') or vim.loop.cwd()
        vim.cmd('ToggleTerm direction=float dir=' .. vim.fn.fnameescape(dir))
      end, { desc = 'ToggleTerm float in buffer dir' })
    end,
  },
}
