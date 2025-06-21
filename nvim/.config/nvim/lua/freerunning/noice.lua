return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
		routes = {
			{
				filter = {
					any = {
						{ event = "notify", find = "NotifyBackground" },
						{ event = "notify", find = "Terminal exited with code" },
						{ event = "notify", find = "Error executing vim.schedule" },
						{ event = "notify", find = "Invalid buffer id" },
						{ event = "msg_show", find = "Invalid buffer id" },
						{ event = "msg_show", find = "nvim_buf_get_name" },
					},
				},
				opts = { skip = true },
			},
		},
		notify = {
			enabled = true,
			background_colour = "#000000",
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}
