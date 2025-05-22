return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
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

			-- virtual line diagnostics, brief and concise (I found it on reddit lol)
			vim.diagnostic.config({
				virtual_text = {
					severity = { min = vim.diagnostic.severity.WARN },
					format = function(diagnostic)
						local first_line = diagnostic.message:gmatch("[^\n]*")()
						local first_sentence = string.match(first_line, "(.-%. )") or first_line
						local first_lhs = string.match(first_sentence, "(.-): ") or first_sentence
						return first_lhs
					end,
				},
			})

			-- logos
			-- [[
			--vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
			--	vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
			--			vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
			--			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
			-- ]]

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},
			})

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
