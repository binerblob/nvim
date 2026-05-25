vim.pack.add({
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
})

require("tiny-inline-diagnostic").setup({
  preset = "classic",
  transparent_bg = false,
  hi = {
    background = "Normal",
    arrow = "@comment",
  },
  signs = {
    left = "",
    right = "",
    diag = "■",
    arrow = "<- ",
    up_arrow = "^^",
    vertical = " │",
    vertical_end = " └",
  },
  
})
-- Not needed because of tiny-inline-diagnostic.nvim
vim.diagnostic.config({ virtual_text = false })
