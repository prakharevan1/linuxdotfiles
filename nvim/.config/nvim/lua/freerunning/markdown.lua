return {
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		ft = "markdown",
		opts = {
			-- add options here
			-- or leave it empty to use the default settings
		},
		keys = {
			-- suggested keymap
			{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		---@module 'render-markdown'
		ft = "markdown",

		---@diagnostic disable-next-line: undefined-doc-name
		---@type render.md.UserConfig
		opts = {
			completions = { lsp = { enabled = true }, blink = { enabled = true } },
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
