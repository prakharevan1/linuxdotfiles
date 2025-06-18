--qol tab spacing
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- very helpful, the undo file, its in the name
vim.opt.undofile = true

require("config.clipboard") -- then my clipboard
require("config.line_nums") -- line numbers
require("config.hide_status") -- hide status bar for tmux
