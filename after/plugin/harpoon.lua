local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { noremap = true, desc = "Add buffer too harpoon list" })
vim.keymap.set("n", "<leader>rm", function() harpoon:list():remove() end, { noremap = true, desc = "Remove buffer from harpoon" })
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { noremap = true, desc = "Open harpoon list" })

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end, { noremap = true, desc = "Jump to first harpoon location" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, { noremap = true, desc = "Jump to first harpoon location" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, { noremap = true, desc = "Jump to first harpoon location" })
vim.keymap.set("n", "ö", function() harpoon:list():select(4) end, { noremap = true, desc = "Jump to first harpoon location" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<M-d>", function() harpoon:list():prev() end, { noremap = true, desc = "Next harpoon list item" })
vim.keymap.set("n", "<M-f>", function() harpoon:list():next() end, { noremap = true, desc = "Previous harpoon list item" })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-g>", function() toggle_telescope(harpoon:list()) end, { noremap = true, desc = "Open harpoon window" })
