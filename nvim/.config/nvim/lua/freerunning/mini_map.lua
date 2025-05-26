return {
	"echasnovski/mini.map",
	version = "*",
	config = function()
		require("mini.map").setup()
		vim.keymap.set("n", "<leader>mT", MiniMap.toggle_focus, { desc = "toggle minimap focus" })
		vim.keymap.set("n", "<leader>mt", MiniMap.toggle, { desc = "toggle minimap" })
		vim.keymap.set("n", "<leader>mr", MiniMap.refresh, { desc = "refresh minimap" })
	end,
}
