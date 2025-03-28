local config = require("config")

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		require("lualine_require").require = require

		local block = {
			function()
				return " "
			end,
			padding = { left = 0, right = 0 },
		}

		local filename = {
			"filename",
			path = 1,
			symbols = {
				modified = "", -- Text to show when the file is modified.
				readonly = "", -- Text to show when the file is non-modifiable or readonly.
				unnamed = "[No Name]", -- Text to show for unnamed buffers.
				newfile = "[New]", -- Text to show for newly created file before first write
			},
		}

		local diagnostics = {
			"diagnostics",
			symbols = config.icons.diagnostics,
		}

		local branch = {
			"branch",
			icon = "",
		}

		return {
			options = {
				globalstatus = true,
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch },
				lualine_c = { filename, "diff" },
				lualine_x = { "%S", diagnostics, "encoding", "filetype" },
				lualine_y = { "location" },
				lualine_z = { block },
			},
			extensions = { "lazy", "mason" },
		}
	end,
	init = function()
		vim.o.showmode = false
		-- vim.o.cmdheight = 0 -- Make sure lualine is at the bottom
		vim.o.showcmdloc = "statusline"
		vim.o.statusline = " "
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/noice.nvim",
	},
}
