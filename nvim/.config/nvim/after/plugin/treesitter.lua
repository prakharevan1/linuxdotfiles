require("nvim-treesitter.configs").setup({
	ensure_installed = {"rust", "java", "toml", "markdown", "markdown_inline", "lua"},
	auto_install = true,
	sync_install = false,
	highlight = {
		enable = true
	},
})
