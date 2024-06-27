return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>tt",
			"<cmd>TodoTrouble<cr>",
			desc = "Todo list (Trouble)",
		},
	},
	config = function()
		require("trouble").setup()
		vim.keymap.set("n", "[t", function()
			require("trouble").prev({ focus = true })
		end)
		vim.keymap.set("n", "]t", function()
			require("trouble").next({ focus = true })
		end)
	end,
}
