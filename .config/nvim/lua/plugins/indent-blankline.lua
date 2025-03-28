return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			scope = {
				highlight = {
					"CursorColumn",
					"Whitespace",
				},
			},
		})
	end,
}
