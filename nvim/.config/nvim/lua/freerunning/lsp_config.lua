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
				handlers = {
					rust_analyzer = function() end,
				},
				automatic_enable = {
					exclude = {
						"rust_analyzer", -- rustaceanvim
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp", "mason-org/mason-lspconfig.nvim" },
		opts = {
			servers = {
				lua_ls = {},
				rust_analyzer = {},
				ltex_plus = {},
			},
		},
		config = function()
			-- blink (auto completion)
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local function blink_cmp(server_name)
				vim.lsp.config(server_name, {
					capabilities = capabilities,
				})
			end

			-- what lsps I want autocompletion for
			blink_cmp("lua_ls")
			blink_cmp("rust_analyzer")
			blink_cmp("ltex_plus")

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
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},
			})

			-- keybindings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Get the quick hover definition for a piece of code" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Get the definition for a piece of code" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ desc = "Get a list of quick code actions" }
			)
		end,
	},
}
