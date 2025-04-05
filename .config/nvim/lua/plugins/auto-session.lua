return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			suppressed_dirs = { "~/", "~/coding", "~/Downloads", "/", "~/dotfiles" },
			auto_restore = false,
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})
		vim.keymap.set("n", "<leader>fa", require("auto-session.session-lens").search_session, { noremap = true })
	end,
}
