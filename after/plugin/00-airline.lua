
if not vim.g.airline_symbols then
    vim.g.airline_symbols = {}
end

-- :h lua-vim-variables -> copies not references, for some weird reason
local airline_symbols = vim.g.airline_symbols

-- unicode symbols
vim.g.airline_left_sep = '»'
vim.g.airline_left_sep = '▶'
vim.g.airline_right_sep = '«'
vim.g.airline_right_sep = '◀'
airline_symbols.colnr = ' ㏇:'
airline_symbols.colnr = ' ℅:'
airline_symbols.crypt = '🔒'
airline_symbols.linenr = '☰'
airline_symbols.linenr = ' ␊:'
airline_symbols.linenr = ' ␤:'
airline_symbols.linenr = '¶'
airline_symbols.maxlinenr = ''
airline_symbols.maxlinenr = '㏑'
airline_symbols.branch = '⎇'
airline_symbols.paste = 'ρ'
airline_symbols.paste = 'Þ'
airline_symbols.paste = '∥'
airline_symbols.spell = 'Ꞩ'
airline_symbols.notexists = ' 󰏌' --  ∄Ɇ
airline_symbols.whitespace = 'Ξ'

-- powerline symbols
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
airline_symbols.branch = '' --  
airline_symbols.colnr = 'C:'
airline_symbols.readonly = ''
airline_symbols.linenr = ' L:'
airline_symbols.maxlinenr = ' ☰ '
airline_symbols.dirty=' ' -- ⚡

vim.g.airline_symbols = airline_symbols

vim.g.airline_theme = 'catppuccin'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#show_buffers'] = 1
vim.g['airline#extensions#tabline#show_tabs'] = 0
vim.g['airline#extensions#tabline#buffer_nr_show'] = 0
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'
vim.o.showtabline = 2
vim.g.airline_powerline_fonts = 1


vim.cmd('AirlineRefresh')

