vim.pack.add({
  "https://github.com/akinsho/bufferline.nvim"
})

require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = "slant",
  }
})
