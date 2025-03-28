return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				integrations = {
					alpha = true,
					-- TODO: bufferline.nvim
					dropbar = {
						enabled = true,
						color_mode = true,
					},
					fidget = true,
					flash = true,
					indent_blankline = {
						enabled = true,
						scope_color = "text",
						colored_indent_levels = true,
					},
					-- TODO: lualine
					treesitter_context = true,
					treesitter = true,
					telescope = true,
				},
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "wave", -- Load "wave" theme
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({})
		end,
	},
}
