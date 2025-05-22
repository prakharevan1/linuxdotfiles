return { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
        -- make my colorscheme catppuccin macchiato
        vim.cmd.colorscheme "catppuccin-macchiato"
    end
}
