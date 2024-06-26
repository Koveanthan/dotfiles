return {
    "nvim-neo-tree/neo-tree.nvim",
    name = "neotree",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                hijack_netrw_behaviour = "open_default",
                use_libuv_file_watcher = true,
            },
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hite_gitignored = false,
            }
        })
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end,
}
