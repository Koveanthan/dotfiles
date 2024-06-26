return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato" -- or latte, frappe, mocha, macchiato
            })
            vim.cmd [[colorscheme catppuccin]]
        end,
    },
}
