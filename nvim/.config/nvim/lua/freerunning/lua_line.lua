return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = { theme = "catppuccin" },
			sections = {
				lualine_z = {
					{
						"datetime",
						-- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
						style = "%I:%M %p",
					},
				},
			},
		})
	end,
}
