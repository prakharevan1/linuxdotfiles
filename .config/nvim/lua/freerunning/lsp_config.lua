return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			-- lsps
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("rust_analyzer")

			-- blink (auto completion)
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			-- virtual line diagnostics
			vim.diagnostic.config({ virtual_text = true })

			-- keybindings
			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{},
				{ desc = "Get the quick hover definition for a piece of code" }
			)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}, { desc = "Get the definition for a piece of code" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{},
				{ desc = "Get a list of quick code actions" }
			)
		end,
	},
}
