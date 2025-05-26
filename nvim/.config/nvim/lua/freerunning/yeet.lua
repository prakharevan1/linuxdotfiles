return {
	"samharju/yeet.nvim",
	dependencies = {
		"stevearc/dressing.nvim", -- optional, provides sane UX
	},
	version = "*", -- use the latest release, remove for master
	cmd = "Yeet",
	lazy = false,
	opts = {},
	config = function()
		require("yeet").setup()
		-- cargo run
		vim.keymap.set({ "n", "v" }, "<leader>rr", '<cmd>lua require("yeet").execute("cargo run")<CR>')
		vim.keymap.set({ "n", "v" }, "<leader>rR", '<cmd>lua require("yeet").execute("cargo run --release")<CR>')
		vim.keymap.set({ "n", "v" }, "<leader>rt", '<cmd>lua require("yeet").execute("cargo test")<CR>')
		vim.keymap.set({ "n", "v" }, "<leader>rc", '<cmd>lua require("yeet").execute("cargo clean")<CR>')
		--		vim.keymap.set({ "n", "v" }, "<leader>rr", '<cmd>lua require("yeet").execute("cargo run")')
		--		vim.keymap.set({ "n", "v" }, "<leader>rr", '<cmd>lua require("yeet").execute("cargo run")')
		--		vim.keymap.set({ "n", "v" }, "<leader>rr", '<cmd>lua require("yeet").execute("cargo run")')
		--		vim.keymap.set({ "n", "v" }, "<leader>rr", '<cmd>lua require("yeet").execute("cargo run")')
	end,
}
