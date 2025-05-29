return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	config = function()
		require("barbar").setup({
			icons = {
				preset = "slanted",
			},
		})

		vim.keymap.set("n", "<A-c>", "<cmd>BufferClose<CR>", { desc = "close the current tab (buffer)" })
		vim.keymap.set("n", "<A-L>", "<cmd>BufferMoveNext<CR>", { desc = "move the current tab forward (buffer)" })
		vim.keymap.set("n", "<A-H>", "<cmd>BufferMovePrevious<CR>", { desc = "move the current tab backward (buffer)" })
		vim.keymap.set("n", "<A-h>", "<cmd>BufferPrevious<CR>", { desc = "move one tab backward (buffer)" })
		vim.keymap.set("n", "<A-l>", "<cmd>BufferPrevious<CR>", { desc = "move one tab forward (buffer)" })
	end,
}
