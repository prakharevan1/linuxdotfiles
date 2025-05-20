return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-macchiato",
			},
			sections = {

				lualine_c = {
					-- ...other lualine components
					{
						require("tmux-status").tmux_windows,
						cond = require("tmux-status").show,
						padding = { left = 3 },
					},
				},
				lualine_z = {
					-- ...other lualine components
					{
						require("tmux-status").tmux_session,
						cond = require("tmux-status").show,
						padding = { left = 3 },
					},
				},
			},
		})
	end,
}
