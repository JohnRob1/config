-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    { 'ellisonleao/gruvbox.nvim', opts = {} },
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = function()
            require('toggleterm').setup {
                open_mapping = [[<leader>tt]],
                start_in_insert = true,
                autochir = true,
                direction = 'float',
            }
            if package.config:sub(1, 1) == '\\' then
                -- I am on Windows
                vim.cmd [[let &shell = '"C:\Program Files\Git\bin\bash.exe"']]
                vim.cmd [[let &shellcmdflag = '-s']]
            end
        end,
    },
    {
        'toppair/peek.nvim',
        event = { 'VeryLazy' },
        build = 'deno task --quiet build:fast',
        config = function()
            require('peek').setup { app = 'browser' }
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end,
    },
    {
        {
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
        },
    },
}
