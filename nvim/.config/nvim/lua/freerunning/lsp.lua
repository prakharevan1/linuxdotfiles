return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			-- auto enable called by mason-lsp config, install by mason, so we dont need that

			-- capabilities support for servers, more completion

			---@diagnostic disable-next-line: lowercase-global
			function blink_cmp(server_name)
				local capabilities = require("blink.cmp").get_lsp_capabilities()
				vim.lsp.config(server_name, {
					capabilities = capabilities,
				})
			end
			-- calling the function
			blink_cmp("lua_ls")
			blink_cmp("rust_analyzer")
			blink_cmp("marksman") -- marksman
			blink_cmp("jdtls") -- java lsp

			-- visual stuff

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
