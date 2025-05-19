-- Enable absolute line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Set relative line number as orange (do this after loading theme)
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#8aadf4" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#b4befe" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#8aadf4" })
