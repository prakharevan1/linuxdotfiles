vim.keymap.set("n", "<C-n>", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open mini files" })

-- snacks rename
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesActionRename",
	callback = function(event)
		Snacks.rename.on_rename_file(event.data.from, event.data.to)
	end,
})
