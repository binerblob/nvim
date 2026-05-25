-- General Neovim options
require 'statusbar'

-- General Neovim options
require 'options'

-- Colorschemes
require 'colorscheme'

-- Plugins

local plugin_path = vim.fn.stdpath 'config' .. '/lua/plugins'

for _, file in ipairs(vim.fn.readdir(plugin_path)) do
  if file:match '%.lua$' then
    local module = 'plugins.' .. file:gsub('%.lua$', '')
    require(module)
  end
end

-- Language stuff
require 'lsp'
