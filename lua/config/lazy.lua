-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.o.background = "light"
-- vim.opt.mouse = ""

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

-- Keybinds
-- vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelUp>', '<Nop>')
-- vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelDown>', '<Nop>')
-- vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelLeft>', '<Nop>')
-- vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelRight>', '<Nop>')
--
-- vim.keymap.set({'n','v','i'}, '<LeftMouse>', '<Nop>')
-- vim.keymap.set({'n','v','i'}, '<RightMouse>', '<Nop>')
-- vim.keymap.set({'n','v','i'}, '<MiddleMouse>', '<Nop>')

vim.keymap.set('n', '<leader>h', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = 'Toggle Inlay Hints' })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
