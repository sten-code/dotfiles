return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk)
		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
		vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer)
		vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer)
		vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk)
		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
		vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline)
		vim.keymap.set("n", "<leader>hb", gitsigns.blame_line)
		vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)
		vim.keymap.set({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")
		vim.keymap.set("n", "<leader>ub", gitsigns.toggle_current_line_blame)

		gitsigns.setup()
	end,
}
