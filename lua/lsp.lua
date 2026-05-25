vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",

  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },

  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/saghen/blink.lib",
  "https://github.com/Saghen/blink.cmp",
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  -- Installed language servers
  ensure_installed = {
		"lua_ls",
		"stylua",
    "clangd",
    "rust_analyzer",
	},
})
-- LSP Configuration
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
      runtime = {
        version = "LuaJIT",
      },
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
-- Treesitter
require("nvim-treesitter.config").setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
  ensure_installed = {
    "lua",
    "c",
    "rust",
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  modules = {},
  highlight = { enable = true }
})
-- Autocompletion
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
  keymap = {
    preset = 'default'
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500
    },
    menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
  },
  sources = { default = { 'lsp', 'path', 'snippets' } },
  cmdline = { enabled = false },
  fuzzy = { implementation = 'lua' },
  signature = { enabled = true }
})
