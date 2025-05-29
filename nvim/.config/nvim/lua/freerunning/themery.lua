return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		-- get themes
		require("freerunning.themes.init")
		local themelist = {
			"catppuccin",
			"catppuccin-macchiato",
			"catppuccin-mocha",
			"catppuccin-frappe",
			"catppuccin-latte",
			"tokyonight",
			"tokyonight-night",
			"tokyonight-storm",
			"tokyonight-day",
			"tokyonight-moon",
			"gruvbox",
		}

		require("themery").setup({
			-- add the config here
			themes = themelist,
			livePreview = true,
		})
		-- keybind
		vim.keymap.set("n", "<leader>t", ":Themery<CR>", { noremap = true, silent = true })
	end,
}
