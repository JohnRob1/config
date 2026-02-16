return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local filetypes = {
      'bash',
      'c',
      'diff',
      'html',
      'htmlangular',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'angular',
    }

    require('nvim-treesitter').setup {
      ensure_installed = filetypes,
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
