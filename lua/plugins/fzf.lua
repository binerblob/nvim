vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/ibhagwan/fzf-lua",
})

require("fzf-lua").setup({"fzf-native"})
vim.keymap.set('n', '<leader>ff', FzfLua.files, { desc = 'Fzf-lua: Files' })
vim.keymap.set('n', '<leader>fb', FzfLua.buffers, { desc = 'Fzf-lua: Buffers' })
vim.keymap.set('n', '<leader>fg', FzfLua.live_grep, { desc = 'Fzf-lua: Live Grep' })
vim.keymap.set('n', '<leader>fd', FzfLua.lsp_workspace_diagnostics, { desc = 'Fzf-lua: Diagnostics' })
vim.keymap.set('n', '<leader>fk', FzfLua.keymaps, { desc = 'Fzf-lua: Keymaps' })
