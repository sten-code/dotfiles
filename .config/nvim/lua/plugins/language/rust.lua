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
	--     "mrcjkb/rustaceanvim",
	--     version = "^6", -- Recommended
	--     lazy = false, -- This plugin is already lazy
	-- },
}
