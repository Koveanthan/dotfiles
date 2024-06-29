return {
	"smoka7/hop.nvim",
	version = "*",
	config = function()
		local hop = require("hop")
		hop.setup({ keys = "etovxqpdygfblzhckisuran" })
		local directions = require("hop.hint").HintDirection
		vim.keymap.set("", "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })
		vim.keymap.set("", "F", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, { remap = true })
		vim.keymap.set("", "t", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		end, { remap = true })
		vim.keymap.set("", "T", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		end, { remap = true })
		vim.keymap.set("", "<leader>hp", "<cmd>HopPattern<CR>")
		vim.keymap.set("", "<leader>hw", "<cmd>HopWord<CR>")
		vim.keymap.set("", "<leader>hl", "<cmd>HopLine<CR>")
	end,
}
