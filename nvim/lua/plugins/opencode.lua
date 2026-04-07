return {
  'nickjvandyke/opencode.nvim',
  version = '*', -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      'folke/snacks.nvim',
      opts = {
        styles = {},
        input = {}, -- Enhances `ask()`
        terminal = {},
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
          },
          win = {
            style = 'float',
            input = {
              keys = {
                ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    -- -- Start server in background on Neovim startup
    -- local server_job
    -- vim.api.nvim_create_autocmd('VimEnter', {
    --   callback = function()
    --     if not server_job then
    --       server_job = vim.fn.jobstart(opencode_cmd, {
    --         detach = false,
    --         on_exit = function() server_job = nil end,
    --       })
    --     end
    --   end,
    -- })
    --
    -- -- Stop server when Neovim exits
    -- vim.api.nvim_create_autocmd('VimLeavePre', {
    --   callback = function()
    --     if server_job then
    --       vim.fn.jobstop(server_job)
    --       server_job = nil
    --     end
    --   end,
    -- })
    --
    -- This functions fixes the delay when opencode first launches causing the cursor to jump back to the Neovim buffer
    -- local function on_opencode_win(win)
    --   require('opencode.terminal').setup(win.win)
    --
    --   local buf = vim.api.nvim_win_get_buf(win.win)
    --   vim.api.nvim_clear_autocmds { event = 'TermRequest', buffer = buf }
    --
    --   local term_request_auid
    --   term_request_auid = vim.api.nvim_create_autocmd('TermRequest', {
    --     buffer = buf,
    --     callback = function(ev)
    --       if ev.data.cursor[1] > 1 then
    --         vim.api.nvim_del_autocmd(term_request_auid)
    --         vim.schedule(function()
    --           if win.win and vim.api.nvim_win_is_valid(win.win) then
    --             vim.api.nvim_set_current_win(win.win)
    --             vim.cmd 'startinsert'
    --           end
    --         end)
    --       end
    --     end,
    --   })
    -- end

    local opencode_cmd = { 'opencode', '--port' }

    ---@type snacks.terminal.Opts
    local snacks_terminal_opts = {
      win = {
        style = 'terminal',
        position = 'float',
        relative = 'editor',
        width = 0.9,
        height = 0.9,
        border = 'rounded',
        enter = true,
        -- on_win = on_opencode_win,
      },
    }

    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        cmd = opencode_cmd,
        start = function() require('snacks.terminal').open(opencode_cmd, snacks_terminal_opts) end,
        stop = function()
          local terminal = require('snacks.terminal').get(opencode_cmd, vim.tbl_deep_extend('force', {}, snacks_terminal_opts, { create = false }))
          if terminal then terminal:close() end
        end,
        toggle = function() require('snacks.terminal').toggle(opencode_cmd, snacks_terminal_opts) end,
      },
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ 'n', 'x' }, '<leader>oa', function() require('opencode').ask('@this: ', { submit = true }) end, { desc = 'Ask opencode…' })
    vim.keymap.set({ 'n', 'x' }, '<leader>on', function()
      require('opencode').command 'session.new'
      require('opencode').ask('@this: ', { submit = true })
    end, { desc = 'New opencode prompt…' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ox', function() require('opencode').select() end, { desc = 'Execute opencode action…' })
    vim.keymap.set({ 'n', 't' }, '<leader>.', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })

    vim.keymap.set({ 'n', 'x' }, 'go', function() return require('opencode').operator '@this ' end, { desc = 'Add range to opencode', expr = true })
    vim.keymap.set('n', 'goo', function() return require('opencode').operator '@this ' .. '_' end, { desc = 'Add line to opencode', expr = true })
  end,
}
