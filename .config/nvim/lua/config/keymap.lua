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
vim.keymap.set("n", "<leader>rn", ":set relativenumber!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", "<cmd>lua switch_case()<CR>", { noremap = true, silent = true })

-- Allow the esc key and ctrl+c to clear the highlighted results
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch)
vim.keymap.set("n", "<C-c>", vim.cmd.nohlsearch)

-- Create an autocmd for SQL filetypes to override <C-c> mappings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sql",
	callback = function()
		-- Clear conflicting <C-c> mappings in insert mode
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>R")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>L")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>l")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>c")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>v")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>p")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>t")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>s")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>T")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>o")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>f")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>k")
		vim.api.nvim_buf_del_keymap(0, "i", "<C-C>a")

		-- Remap <C-c> to behave like <Esc>
		vim.api.nvim_buf_set_keymap(0, "i", "<C-c>", "<Esc>", { noremap = true, silent = true })
	end,
})

-- Navigation between split panes
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")

-- Center screen after jumping
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-b>", "<c-b>zz")

-- Keeps current copied text in the buffer after pasting over something in visual mode
vim.keymap.set("x", "<leader>p", '"_dP')

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Automatically center after going to next search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

if vim.g.neovide then
	vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<C-c>", '"+y') -- Copy
	vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode

	vim.g.neovide_scroll_animation_length = 0.1
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_animate_in_insert_mode = true
	-- vim.g.neovide_cursor_smooth_blink = true

	vim.o.guifont = "JetBrainsMono Nerd Font Mono"
end
