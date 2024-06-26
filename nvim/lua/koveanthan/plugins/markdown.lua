return {
    {
        "preservim/vim-markdown",
        branch = "master",
        require = { 'godlygeek/tabular' },
        config = function()
            vim.cmd("let g:vim_markdown_conceal = 0")
            vim.cmd("let g:vim_markdown_frontmatter = 1")
            vim.cmd("let g:vim_markdown_folding_style_pythonic = 1")
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        config = function()
            vim.cmd("let g:mkdp_markdown_css = '/Users/kovean-2368/.local/lib/github-markdown-css/github-markdown.css'")
            vim.cmd("let g:mkdp_refresh_slow = 0")
            vim.keymap.set("n", "<leader>m", "<cmd>MarkdownPreviewToggle<CR>")
        end,
    },
}
