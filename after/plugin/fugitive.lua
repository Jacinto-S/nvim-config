vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = "Git status" })
vim.keymap.set('n', '<leader>ga', '_wy$:Git add <C-r>0<Enter>', { noremap = true, desc = "Git add file" })
vim.keymap.set('n', '<leader>gr', '_wy$:Git restore --staged <C-r>0<Enter>', { noremap = true, desc = "Git restore file" })
vim.keymap.set('n', '<leader>gx', '_wy$:Git rm --cached <C-r>0<Enter>', { noremap = true, desc = "Git remove file" })
vim.keymap.set('n', '<leader>gc', ':Git commit -m ""<Left>', { noremap = true, desc = "Git commit" })
vim.keymap.set('n', '<leader>gp', ':Git push<Enter>', { noremap = true, desc = "Git push" })
vim.keymap.set('n', '<leader>gf', ':Git fetch<Enter>', { noremap = true, desc = "Git fetch" })
vim.keymap.set('n', '<leader>gi', '_wy$:aboveleft split <C-r>0<Enter>', { noremap = true, desc = "Inspect file" })

