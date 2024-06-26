return {
	"nvim-treesitter/nvim-treesitter",
	build = { ":TSUpdate" },
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			-- list of parser to ignore
			ignore_install = {},

			-- install languages synchronously. Only applied to ensure_installed
			sync_install = false,
			ensure_installed = {},
			auto_install = true,
			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = { enable = true },
			textobjects = { enable = true },
		})
	end,
}
