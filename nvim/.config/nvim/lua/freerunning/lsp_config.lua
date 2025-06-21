return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"java-debug-adapter",
				"java-test",
			},
		},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "jdtls" },
			automatic_enable = {
				exclude = {
					"jdtls",
					"rust_analyzer", -- we have configured these both
				},
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			--			"neovim/nvim-lspconfig",
		},
	},
	{
		"folke/lazydev.nvim", -- extra completion for lua files
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ "nvim-dap-ui" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		priority = 1000, -- lsp is very important, prob more than the other plugins
		dependencies = { "saghen/blink.cmp" },
		config = function()
			-- we need to set up blink cmp capabilities
			---@diagnostic disable-next-line: lowercase-global
			function blink_cmp(server_name)
				local capabilities = require("blink.cmp").get_lsp_capabilities()
				vim.lsp.config(server_name, {
					capabilities = capabilities,
				})
			end
			-- btw, for future me, the keybind "grn" in normal mode on top of a variable/function renames it everywhere :)
			-- calling it for each lsp
			blink_cmp("rust_analyzer") -- rust
			blink_cmp("lua_ls") -- lua
			blink_cmp("jdtls") -- java, the hardest one to set up by FAR

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
