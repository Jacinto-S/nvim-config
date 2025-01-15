vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Enter project view (Ex mode)" })

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down selection" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move down selection" })

-- vim.keymap.set("n", "J", "mzJ`Z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Stay in middle after down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Stay in middle after up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Stay in middle when scrolling search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Stay in middle when scrolling search" })

vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste without losing copy" })
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete without losing copy" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete without losing copy" })

vim.keymap.set("n", "<tab>", vim.cmd.bnext, { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious, { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>w", vim.cmd.bd, { desc = "Close buffer" })

vim.keymap.set("n", "<C-s>", ":w<Enter>", { desc = "Save" })
vim.keymap.set("v", "<C-s>", "<Escape>:w<Enter>", { desc = "Save" })
vim.keymap.set("n", "<C-q>", ":q<Enter>", { desc = "Quit" })

vim.keymap.set("n", "Q", "<nop>") -- don't quit w/o saving on accident
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor globally" })
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Toggle scrolling with <C-e> and <C-y> between normal and staying in place
vim.keymap.set('n', '<C-e>', '<C-e>j', { noremap = true, silent = true, desc = "Scroll while staying in place" })
vim.keymap.set('n', '<C-y>', '<C-y>k', { noremap = true, silent = true, desc = "Scroll while staying in place" })

local scroll_cursor_toggle = false

function ToggleScrollCursor()
    if scroll_cursor_toggle then
        vim.keymap.del('n', '<C-e>')
        vim.keymap.del('n', '<C-y>')
        scroll_cursor_toggle = false
    else
        vim.keymap.set('n', '<C-e>', '<C-e>j', { noremap = true, silent = true, desc = "Scroll down and move cursor" })
        vim.keymap.set('n', '<C-y>', '<C-y>k', { noremap = true, silent = true, desc = "Scroll up and move cursor" })
        scroll_cursor_toggle = true
    end
end

vim.keymap.set('n', '<Leader>ts', ToggleScrollCursor, { noremap = true, silent = true, desc = "Toggle scroll and cursor mappings" })

