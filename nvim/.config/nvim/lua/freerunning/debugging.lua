return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"folke/lazydev.nvim",
	},
	config = function()
		-- auto close and open dap
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		-- type checking, autodetection, etc.
		require("lazydev").setup({
			library = { "nvim-dap-ui" },
		})

		-- codelldb debugger
		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb",
		}
		dapui.setup()

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		dap.configurations.rust = dap.configurations.cpp

		-- dap breakpoint logos
		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
		)

		-- dap keybindings
		vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", {})
		vim.keymap.set("n", "<leader>dp", "<cmd>DapPause<cr>", {})
		vim.keymap.set("n", "<leader>ds", "<cmd>DapStepInto<cr>", {})
		vim.keymap.set("n", "<leader>dS", "<cmd>DapStepInto<cr>", {})
		vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", {})
	end,
}
