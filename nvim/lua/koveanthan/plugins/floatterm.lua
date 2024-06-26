return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({})
		vim.keymap.set("n", "<C-b>", '<CMD>wa<CR><CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<C-b>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
