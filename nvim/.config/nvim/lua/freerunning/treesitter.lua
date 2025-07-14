return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "OXY2DEV/markview.nvim" },
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
}
