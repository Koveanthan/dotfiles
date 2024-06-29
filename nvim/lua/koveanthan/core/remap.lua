vim.g.mapleader = " "
-- not being used as netrw disabled and nvim-tree is used
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>a", ":wa<CR>")
vim.keymap.set("n", "<leader>x", ":q!<CR>")

-- Switch buffer
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<C-x>", "<cmd>bdelete<CR>")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<Enter>", "mai<CR><Esc>'a^<cmd>s/\\s\\+$//<CR><cmd>let @/=''<CR>j0v$hgq^")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "O", "maO<Esc>'a")
vim.keymap.set("n", "o", "mao<Esc>'a")

vim.keymap.set("n", "<F2>", "<cmd>set rnu!<CR>")

-- For removing beginning and ending trail spaces
vim.keymap.set("n", "<leader>sb", "0d^")
vim.keymap.set("n", "<leader>se", "$g_ld$")

vim.keymap.set("n", "F_", "F_l")
vim.keymap.set("n", "f_", "f_l")

-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever - Prime - Not sure how it works
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- Solved with vim.opt.clipboard = 'unnamedplus'
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
--
-- vim.keymap.set({"n", "v"}, "<leader>d", [["+d]])
-- vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
-- vim.keymap.set({"n", "v"}, "<leader>P", [["+P]])

-- Remove text without copying to clipboard
vim.keymap.set({ "n", "v" }, "X", [["_x]])
-- Paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dP')

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")

-- Have never used loclist. Not using it!
-- vim.keymap.set("n", "<leader><C-k>", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader><C-j>", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--
-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/koveanthan/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
--
vim.keymap.set("n", "<leader>H", ":nohlsearch<CR>")

-- Resizing panes
vim.keymap.set("n", "<Left>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<Up>", ":resize -1<CR>")
vim.keymap.set("n", "<Down>", ":resize +1<CR>")

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- To highlight on yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
