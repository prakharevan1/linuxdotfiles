return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
			-- automatic attach with dapui
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

			dap.adapters.codelldb = {
				type = "executable",
				command = "codelldb",
			}
			-- rust
			dap.configurations.rust = {
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
			vim.keymap.set(
				"n",
				"<leader>dc",
				":lcd %:p:h:h | DapContinue<CR>",
				{ desc = "Start debugging with a DAP." }
			)

			vim.keymap.set("n", "<leader>dt", ":DapTerminate<CR>", { desc = "Terminate the debugging DAP (exit)." })

			vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle a debugging breakpoint." })

			vim.keymap.set(
				"n",
				"<leader>dB",
				":DapClearBreakpoints<CR>",
				{ desc = "Clear all the debugging breakpoints." }
			)

			vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>", { desc = "Step over with the debugger." })
			vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>", { desc = "Step into with the debugger." })
			vim.keymap.set("n", "<leader>dO", ":DapStepOut<CR>", { desc = "Step out with the debugger." })
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
