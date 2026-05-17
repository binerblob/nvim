return {
  {
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require("monokai-pro").setup({
        override = function(scheme)
          return {
            LineNr = { fg = scheme.base.dimmed2, bg = scheme.base.black },
            CursorLineNr = { fg = scheme.base.white, bg = scheme.base.black },
            SignColumn = { bg = scheme.base.black },
            --MsgArea = { bg = scheme.base.black }
          }
        end
      })
      vim.cmd.colorscheme 'monokai-pro-classic'
      vim.cmd.hi 'Comment gui=none'
      vim.opt.signcolumn = 'auto'
    end
  },
}
