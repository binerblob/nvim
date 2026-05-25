vim.pack.add {
  'https://github.com/loctvl842/monokai-pro.nvim',
  'https://github.com/ellisonleao/gruvbox.nvim',
}

require('monokai-pro').setup {
  override = function(scheme)
    return {
      LineNr = { fg = scheme.base.dimmed2, bg = scheme.base.black },
      CursorLineNr = { fg = scheme.base.white, bg = scheme.base.black },
      SignColumn = { bg = scheme.base.black },
      NormalFloat = { bg = scheme.base.black },
    }
  end,
}
vim.cmd 'colorscheme gruvbox'
