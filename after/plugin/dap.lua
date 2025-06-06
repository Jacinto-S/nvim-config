local dap = require('dap')
require('dap-python').setup("python")

vim.keymap.set('n', '<leader>dp', dap.toggle_breakpoint, { noremap = true, desc = 'Debugger Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dso', dap.step_over, { noremap = true, desc = 'Debugger Step Over' })
vim.keymap.set('n', '<leader>dsi', dap.toggle_breakpoint, { noremap = true, desc = 'Debugger Step Into' })
vim.keymap.set('n', '<leader>dsx', dap.toggle_breakpoint, { noremap = true, desc = 'Debugger Step Out' })

vim.keymap.set('n', '<leader>dsx', dap.toggle_breakpoint, { noremap = true, desc = 'Debugger Step Out' })

