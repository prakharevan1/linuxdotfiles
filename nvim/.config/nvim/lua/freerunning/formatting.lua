return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua", lsp_format = "fallback" },
			rust = { "rustfmt", lsp_format = "fallback" },
			markdown = { "prettierd", lsp_format = "fallback" },
			java = { "clang-format", lsp_format = "fallback" },
		},
		-- auto format on save
		format_on_save = {
			-- timeout_ms = 1000,
			lsp_format = "fallback",
		},
	},
}
