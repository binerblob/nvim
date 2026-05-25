vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

local function diagnostics()
  local parts = {}

  local severities = {
    {
      severity = vim.diagnostic.severity.ERROR,
      label = 'E:',
      hl = '%#DiagnosticError#',
    },
    {
      severity = vim.diagnostic.severity.WARN,
      label = 'W:',
      hl = '%#DiagnosticWarn#',
    },
    {
      severity = vim.diagnostic.severity.INFO,
      label = 'I:',
      hl = '%#DiagnosticInfo#',
    },
    {
      severity = vim.diagnostic.severity.HINT,
      label = 'H:',
      hl = '%#DiagnosticHint#',
    },
  }

  for _, entries in ipairs(severities) do
    local count = #vim.diagnostic.get(0, {
      severity = entries.severity,
    })
    if count > 0 then
      table.insert(parts, entries.hl)
      table.insert(parts, entries.label .. count)
      table.insert(parts, '%#StatusLine# ')
    end
  end

  return table.concat(parts)
end

require('gitsigns').setup {
  signcolumn = false,
}

local function git()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == '' then
    return ''
  end

  local head = git_info.head
  local added = git_info.added and ('%#GitSignsAdd# +' .. git_info.added .. '%#StatusLine#') or ''
  local changed = git_info.changed and ('%#GitSignsChange# ~' .. git_info.changed .. '%#StatusLine#') or ''
  local removed = git_info.removed and ('%#GitSignsDelete# -' .. git_info.removed .. '%#StatusLine#') or ''
  if git_info.added == 0 then
    added = ''
  end
  if git_info.changed == 0 then
    changed = ''
  end
  if git_info.removed == 0 then
    removed = ''
  end

  return table.concat {
    '[:', -- branch icon
    head,
    added,
    changed,
    removed,
    ']',
  }
end

local function get_buffer_count()
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  return #buffers
end

function Statusline()
  if vim.g.statusline_winid ~= vim.api.nvim_get_current_win() then
    return '%f [unfocused]'
  end

  return table.concat {
    -- "Bufs:" .. get_buffer_count() .. "    ",
    '%f ',
    git(),
    '%=',
    diagnostics(),
    '%y ',
    '%l,%c    %P',
  }
end

vim.o.statusline = '%!v:lua.Statusline()'
