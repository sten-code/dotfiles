return {
	{
		"Saecki/crates.nvim",
		tag = "stable",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^6", -- Recommended
	-- 	lazy = false, -- This plugin is already lazy
	-- 	init = function()
	-- 		vim.g.rustaceanvim = {
	-- 			server = {
	-- 				on_attach = function(_, bufnr)
	-- 					require("config.lsp").on_attach(bufnr)
	-- 				end,
	-- 			},
	-- 		}
	-- 	end,
	-- },
}
