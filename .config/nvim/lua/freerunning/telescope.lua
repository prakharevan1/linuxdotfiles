return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-lua/plenary.nvim' }, 
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },-- better fzf speeds
        {"nvim-telescope/telescope-ui-select.nvim"}
    },
    config = function()
        local telescope, builtin = require('telescope'), require('telescope.builtin')
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
                fzf = {}
            },
        })
        require("telescope").load_extension("ui-select")
        telescope.load_extension('fzf')
        function fuzzyfinder()
            builtin.grep_string({
                path_display = { 'smart' },
                only_sort_text = true,
                word_match = "-w",
                search = '',
            })
        end
        vim.keymap.set({'n', 'v'}, '<leader>fg', '<cmd>lua fuzzyfinder{}<cr>', {})
        vim.keymap.set({'n', 'v'}, '<C-p>', '<cmd> Telescope find_files<cr>', {})
    end,
}
