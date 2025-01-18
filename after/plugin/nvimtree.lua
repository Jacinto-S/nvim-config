-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



require("nvim-tree").setup({
  -- Setup for project.nvim
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Focus NvimTree" })
