vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.g.background = "light"

function switch_case()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	local word = vim.fn.expand("<cword>")
	local word_start = vim.fn.matchstrpos(vim.fn.getline("."), "\\k*\\%" .. (col + 1) .. "c\\k*")[2]

	-- Detect camelCase
	if word:find("[a-z][A-Z]") then
		-- Convert camelCase to snake_case
		local snake_case_word = word:gsub("([a-z])([A-Z])", "%1_%2"):lower()
		vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { snake_case_word })
		-- Detect snake_case
	elseif word:find("_[a-z]") then
		-- Convert snake_case to camelCase
		local camel_case_word = word:gsub("(_)([a-z])", function(_, l)
			return l:upper()
		end)
		vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { camel_case_word })
	else
		print("Not a snake_case or camelCase word")
	end
end

-- Useful binds
vim.api.nvim_set_keymap("n", "<leader>rn", ":set relativenumber!<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<leader>cc", [[:s/\v_(.)/\U\1/g<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<leader>sc", [[:s/\v([a-z])([A-Z])/\1_\l\2/g<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua switch_case()<CR>", { noremap = true, silent = true })

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- For some reason it's flipped by default (even with --noplugin and -u NORC), so this makes it so n is next and N is previous
vim.api.nvim_set_keymap("n", "n", "N", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "n", { noremap = true, silent = true })
