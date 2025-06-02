-- keymaps
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {desc = "Live grep with telescope."})
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", {desc = "Find files with telescope."})
