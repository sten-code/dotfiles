return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
			vim.keymap.set("n", "<leader>fm", builtin.marks, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"andrew-george/telescope-themes",
		config = function()
			require("telescope").load_extension("themes")
			vim.keymap.set(
				"n",
				"<leader>th",
				":Telescope themes<CR>",
				{ noremap = true, silent = true, desc = "Theme Switcher" }
			)
		end,
	},
}
