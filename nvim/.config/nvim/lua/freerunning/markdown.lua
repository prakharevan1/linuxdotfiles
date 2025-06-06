---@diagnostic disable: missing-fields
return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = { lsp = { enabled = true }, blink = { enabled = true } },
		},
	},
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			"Saghen/blink.cmp",

			-- see above for full list of optional dependencies ☝️
		},
		---@module 'obsidian'
		---@type obsidian.config.ClientOpts
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Documents/notes/",
				},
			},
			completion = {
				blink = true,
			},
			img_dirs = {
				"img",
				"images",
				"assets",
				"static",
				"public",
				"media",
				"attachments",
				"~/Documents/notes/assets/imgs/",
			},

			-- see below for full list of options 👇
		},
	},
}
