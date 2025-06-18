return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	--	dependencies = { 'nvim-lua/plenary.nvim' } dependencies.lua file contains this
	keys = {
		{
			"<C-p>",
			require("telescope.builtin").find_files,
			mode = "n",
			desc = "Telescope find files",
		},
		{
			"<leader>fg",
			require("telescope.builtin").live_grep,
			mode = "n",
			desc = "Telescope live grep",
		},
	},
}
