-- enable line nums
vim.cmd("set number")
vim.cmd("set relativenumber")
-- cursorline
vim.opt.cursorline = true

-- line number colors
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#8aadf4', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#ed8796', bold=false })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#c6a0f6', bold=true })

end

LineNumberColors()
