return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin-macchiato")
		vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#b7bdf8", bg = "NONE", bold = true })
	end,
}
