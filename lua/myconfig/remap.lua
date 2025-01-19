vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { noremap = true, desc = "Enter project view (Ex mode)" })

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { noremap = true, desc = "Move down selection" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { noremap = true, desc = "Move down selection" })

-- vim.keymap.set("n", "J", "mzJ`Z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Stay in middle after down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Stay in middle after up" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, desc = "Stay in middle when scrolling search" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, desc = "Stay in middle when scrolling search" })

vim.keymap.set("n", "<leader>th", ":split | terminal<Enter>i", { noremap = true, desc = "Horizontal terminal (bottom)"})
vim.keymap.set("n", "<leader>tv", ":vsplit | terminal<Enter>i", { noremap = true, desc = "Vertical terminal (right)"})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", ":lua ToggleTerminal()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n>:lua ToggleTerminal()<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>:bd!<Enter>", { noremap = true, desc = "Close terminal buffer" })

vim.keymap.set("x", "<leader>p", "\"_dP", { noremap = true, desc = "Paste without losing copy" })
vim.keymap.set("n", "<leader>x", "\"_d", { noremap = true, desc = "Delete without losing copy" })
vim.keymap.set("v", "<leader>x", "\"_d", { noremap = true, desc = "Delete without losing copy" })

vim.keymap.set("n", "<tab>", vim.cmd.bnext, { noremap = true, desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious, { noremap = true, desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>c", vim.cmd.bd, { noremap = true, desc = "Close buffer" })
vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = true, desc = "Window manager" })
vim.keymap.set("n", "+", "<C-w><", { noremap = true, desc = "Expand window" })
vim.keymap.set("n", "-", "<C-w>>", { noremap = true, desc = "Decrease window" })

vim.keymap.set("n", "<C-s>", ":w<Enter>", { noremap = true, desc = "Save" })
vim.keymap.set("v", "<C-s>", "<Escape>:w<Enter>", { noremap = true, desc = "Save" })
vim.keymap.set("n", "<C-q>", ":q<Enter>", { noremap = true, desc = ":q" })
vim.keymap.set("n", "<leader>q", ":qa<Enter>", { noremap = true, desc = "Quit completely" })

vim.keymap.set("n", "Q", "<nop>") -- Don't quit w/o saving on accident
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, desc = "Substitute word under cursor globally" })
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Toggle scrolling with <C-e> and <C-y> between normal and staying in place
vim.keymap.set('n', '<C-e>', '<C-e>j', { noremap = true, silent = true, desc = "Scroll while staying in place" })
vim.keymap.set('n', '<C-y>', '<C-y>k', { noremap = true, silent = true, desc = "Scroll while staying in place" })

local scroll_cursor_toggle = false

function ToggleScrollCursor()
    if scroll_cursor_toggle then
        vim.keymap.del('n', '<C-e>', { noremap = true })
        vim.keymap.del('n', '<C-y>', { noremap = true })
        scroll_cursor_toggle = false
    else
        vim.keymap.set('n', '<C-e>', '<C-e>j', { noremap = true, silent = true, desc = "Scroll down and move cursor" })
        vim.keymap.set('n', '<C-y>', '<C-y>k', { noremap = true, silent = true, desc = "Scroll up and move cursor" })
        scroll_cursor_toggle = true
    end
end

vim.keymap.set('n', '<Leader>ts', ToggleScrollCursor, { noremap = true, silent = true, desc = "Toggle scroll and cursor mappings" })

