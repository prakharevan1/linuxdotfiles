require("nvim-treesitter.configs").setup({
	ensure_installed = { "rust", "java", "lua", "markdown", "markdown_inline", "toml", "tmux", "vim", "vimdoc" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		disable = { "tmux" }, -- treesitter is weird on tmux highlight
	},
	additional_vim_regex_highlighting = false,
})
