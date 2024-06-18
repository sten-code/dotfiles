return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            integrations = {
                treesitter = true,
                telescope = true,
            }
        })

		vim.cmd.colorscheme("catppuccin")
	end,
}
