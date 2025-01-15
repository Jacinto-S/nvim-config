local builtin = require('telescope.builtin')

-- TODO: Get this to work
local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous
            }
        },
    }
})

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope all project files search' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git file search' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope general text project search' })
