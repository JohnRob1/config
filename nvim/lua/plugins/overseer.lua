-- Using lazy.nvim packager
return {
  {
    'stevearc/overseer.nvim',
    opts = {
      -- Tell overseer to load VS Code tasks automatically
      task_launchers = {
        vscode = { enabled = true },
      },
      -- Configure how the output terminal behaves in nvim
      strategy = {
        'terminal',
        quit_on_exit = 'never',
      },
    },
    config = function(_, opts)
      local overseer = require 'overseer'
      overseer.setup(opts)
      -- Keymap to instantly run the default project task (matches VS Code behavior)
      vim.keymap.set('n', '<leader>rr', function()
        vim.cmd 'write' -- Auto-save current file
        overseer.run_task()
      end, { desc = 'Project OOB Runner' })

      -- Keymap to toggle the task status/output panel
      vim.keymap.set('n', '<leader>ro', ':OverseerToggle<CR>', { desc = 'Toggle Runner Panel' })
    end,
  },
}
