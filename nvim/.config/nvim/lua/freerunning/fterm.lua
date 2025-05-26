return {
	"numToStr/FTerm.nvim",
	config = function()
		vim.keymap.set("n", "<leader>T", '<CMD>lua require("FTerm").toggle()<CR>')
	end,
}
