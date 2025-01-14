function ColorMyPencils(color)
	color = color or 'catppuccin-mocha'
	vim.cmd.colorscheme(color)
end

ColorMyPencils()

local transparent_background = false

function ToggleBackground()
	if transparent_background then
		ColorMyPencils()
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = nil })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = nil })
		transparent_background = false
	else
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
		transparent_background = true
	end
end

vim.keymap.set({'n', 'v', 'o'}, '<leader>tb', ToggleBackground, { noremap = true, silent = true, desc = 'Toggle background transparency' })
