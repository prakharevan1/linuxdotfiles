return {
	"echasnovski/mini.files",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local opts = {
			mappings = {
				close = "q",
				go_in = "<CR>",
				go_in_plus = "L",
				go_out = "<Esc>",
				go_out_plus = "H",
				mark_goto = "'",
				mark_set = "m",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
			windows = {
				preview = true,
			},
			options = {
				use_icons = true, -- <- this must be true
			},
		}

		require("mini.files").setup(opts)
		vim.keymap.set("n", "<C-n>", "<cmd>:lua MiniFiles.open()<CR>", { desc = "Open current dir with mini files" })

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesActionRename",
			callback = function(event)
				Snacks.rename.on_rename_file(event.data.from, event.data.to)
			end,
		})
	end,
}
