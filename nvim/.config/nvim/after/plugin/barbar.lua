-- movement
vim.keymap.set('n', '<A-h>', '<Cmd>BufferPrevious<CR>', {desc = "Move backward a buffer."})
vim.keymap.set('n', '<A-l>', '<Cmd>BufferNext<CR>', {desc = "Move forward a buffer."})

-- re order
vim.keymap.set('n', '<A-H>', '<Cmd>BufferMovePrevious<CR>', {desc = "Move the buffer backward by one"})
vim.keymap.set('n', '<A-L>', '<Cmd>BufferMoveNext<CR>', {desc = "Move the buffer forward by one"})

-- close buffer
vim.keymap.set('n', '<A-x>', '<Cmd>BufferClose<CR>', {desc = "close the current buffer"})
