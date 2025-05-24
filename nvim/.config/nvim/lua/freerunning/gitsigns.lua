return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()

		-- keybinds
		vim.keymap.set(
			{ "n", "v" },
			"<leader>gb",
			"<cmd>Gitsigns toggle_current_line_blame<CR>",
			{ desc = "Github toggle current line blame." }
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>gh",
			"<cmd>Gitsigns preview_hunk_inline<CR>",
			{ desc = "Gitsigns preview hunk" }
		)
	end,
}
