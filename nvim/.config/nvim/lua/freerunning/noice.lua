return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			routes = {
				{
					filter = {
						event = "notify",
						find = "Highlight group 'NotifyBackground' has no background highlight",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "lsp",
						kind = "error",
						find = "RPC[Error] code_name = ContentModified",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "notify",
						find = "Defining diagnostic signs with :sign-define or sign_define() is deprecated. Run ",
					},
					opts = { skip = true },
				},
			},
			notify = {
				background_colour = "#000000",
			},
		})
	end,
}
