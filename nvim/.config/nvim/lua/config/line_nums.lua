-- enable line nums
vim.cmd("set number")
vim.cmd("set relativenumber")
-- cursorline
vim.opt.cursorline = true

-- line number colors
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#4fd6be', bold=true })
--    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=false }) auto set to orange by cursorline
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#ff757f', bold=true })

end

LineNumberColors()
