return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{
		"nvim-tree/nvim-web-devicons",
		--		opts = {},
		event = "VeryLazy",
	},
	{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
	{
		"stevearc/dressing.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"MunifTanjim/nui.nvim",
		event = "VeryLazy",
	},
}
