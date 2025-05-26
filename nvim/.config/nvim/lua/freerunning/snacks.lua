return -- lazy.nvim
{
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		image = {
			-- your image configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		gitbrowse = {},
		indent = {},
		dim = {},
		lazygit = {},
		quickfile = {},
		zen = {},
	},
	config = function()
		-- gitbrowse
		vim.keymap.set(
			{ "n", "v" },
			"<leader>go",
			"<cmd>lua Snacks.gitbrowse()<cr>",
			{ desc = "open the current file in github on your browser." }
		)

		-- dim swapping
		local bool = false
		local function snacks_dim()
			if bool == false then
				bool = true
				vim.cmd("lua Snacks.dim.enable()")
			else
				bool = false
				vim.cmd("lua Snacks.dim.disable()")
			end
		end
		vim.keymap.set({ "n", "v" }, "<leader>d", snacks_dim, { desc = "dim all other panes for focused programming." })

		-- indent auto enable
		vim.api.nvim_create_autocmd("BufReadPost", {
			callback = function()
				vim.cmd("lua Snacks.indent.enable()")
			end,
		})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>gl",
			"<cmd>lua Snacks.lazygit()<cr>",
			{ desc = "dim all other panes for focused programming." }
		)
		-- zen mode
		vim.keymap.set({ "n", "v" }, "<leader>z", "<cmd>lua Snacks.zen()", { desc = "activate zen coding mode." })
	end,
}
