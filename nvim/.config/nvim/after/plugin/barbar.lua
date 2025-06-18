vim.cmd([[ augroup ChangeHighlight autocmd! autocmd BufEnter * highlight BufferTabpageFill guibg=#000000 augroup END ]])

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map("n", "<A-h>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-l>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<A-H>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A-L>", "<Cmd>BufferMoveNext<CR>", opts)

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- other commands
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
