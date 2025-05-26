return {
	"piersolenski/wtf.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		openai_api_key = "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",
	},
	keys = {
		{
			"<leader>wa",
			mode = { "n", "x" },
			function()
				require("wtf").ai()
			end,
			desc = "Debug diagnostic with AI",
		},
		{
			mode = { "n" },
			"<leader>ws",
			function()
				require("wtf").search()
			end,
			desc = "Search diagnostic with Google",
		},
		{
			mode = { "n" },
			"<leader>wh",
			function()
				require("wtf").history()
			end,
			desc = "Populate the quickfix list with previous chat history",
		},
		{
			mode = { "n" },
			"<leader>wg",
			function()
				require("wtf").grep_history()
			end,
			desc = "Grep previous chat history with Telescope",
		},
	},
}
