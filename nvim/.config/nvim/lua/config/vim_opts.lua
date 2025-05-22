-- tabstops, QoL, etc.
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.termguicolors = true
-- Lazy load vim.version when required
vim.cmd([[autocmd VimEnter * lua require('vim.version')]])

-- keybinding for leader
vim.g.mapleader = " "

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- auto save command with CTRL S
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", {})
