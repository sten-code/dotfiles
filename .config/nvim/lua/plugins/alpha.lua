-- Create button for initial keybind.
--- @param sc string
--- @param txt string
--- @param hl string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, hl, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = hl,
	}

	if keybind then
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "normal", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local headers = {
	{
		[[                                                                       ]],
		[[                                                                       ]],
		[[                                                                       ]],
		[[                                                                       ]],
		[[                                                                     ]],
		[[       ████ ██████           █████      ██                     ]],
		[[      ███████████             █████                             ]],
		[[      █████████ ███████████████████ ███   ███████████   ]],
		[[     █████████  ███    █████████████ █████ ██████████████   ]],
		[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
		[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
		[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
		[[                                                                       ]],
		[[                                                                       ]],
		[[                                                                       ]],
	},
	{
		[[            .-'''''-.    ]],
		[[          .'         `.  ]],
		[[         :             : ]],
		[[        :               :]],
		[[        :      _/|      :]],
		[[         :   =/_/      : ]],
		[[          `._/ |     .'  ]],
		[[       (   /  ,|...-'    ]],
		[[        \_/^\/||__       ]],
		[[     _/~  `""~`"` \_     ]],
		[[  __/  -'.  ` .  `\_\__  ]],
		[[/jgs     \           \-.\ ]],
	},
	{
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
		"⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ",
		"⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ",
		"⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ",
		"⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ",
		"⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ",
		"⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ",
		"⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ",
		"⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ",
		"⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ",
		"⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
		"⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ",
		"⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ",
	},
	{
		[[=================     ===============     ===============   ========  ========]],
		[[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
		[[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
		[[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
		[[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
		[[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
		[[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
		[[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
		[[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
		[[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
		[[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
		[[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
		[[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
		[[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
		[[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
		[[||.=='    _-'                                                     `' |  /==.||]],
		[[=='    _-'                        N E O V I M                         \/   `==]],
		[[\   _-'                                                                `-_   /]],
		[[ `''                                                                      ``' ]],
	},
	{
		[[  ／|_       ]],
		[[ (o o /      ]],
		[[  |.   ~.    ]],
		[[  じしf_,)ノ ]],
	},
	{
		"          ▀████▀▄▄              ▄█ ",
		"            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
		"    ▄        █          ▀▀▀▀▄  ▄▀  ",
		"   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
		"  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
		"  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
		"   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
		"    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
		"   █   █  █      ▄▄           ▄▀   ",
	},
	{
		"                                                     ",
		"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
		"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
		"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		"                                                     ",
	},
	{
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	},
}

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")

		local header = {
			type = "text",
			val = headers[1],
			opts = {
				position = "center",
				h1 = "Whitespace",
			},
		}

		local buttons = {
			type = "group",
			val = {
				button("e", "  New Buffer", "RainbowRed", ":tabnew<CR>"),
				button("f", "  Find file", "RainbowYellow", ":Telescope find_files<CR>"),
				button("h", "  Recently opened files", "RainbowOrange", ":Telescope oldfiles<CR>"),
				button("l", "  Projects", "RainbowGreen", ":Telescope marks<CR>"),
				button("r", "  Restore latest session", "RainbowBlue", ":SessionRestore<CR>"),
				button("c", "  Open Config", "RainbowBlue", ":cd ~/.config/nvim<CR>:e init.lua<CR>"),
				button("q", "󰅚  Quit", "RainbowViolet", ":q<CR>"),
			},
			opts = {
				spacing = 1,
			},
		}

		local footer = {
			type = "text",
			-- Change 'rdn' to any program that gives you a random quote.
			-- https://github.com/BeyondMagic/scripts/blob/master/quotes/rdn
			-- Which returns one to three lines, being each divided by a line break.
			-- Or just an array: { "I see you:", "Above you." }
			val = {
				"Mensen in afrika zijn minder geëvolueerd.",
				"                            Tein de Hamer",
			}, -- split(capture('rdn')),
			hl = "NvimTreeRootFolder",
			opts = {
				position = "center",
				hl = "Whitespace",
			},
		}

		-- alpha.setup(dashboard.opts)
		local occupied_lines = {
			icon = #header.val, -- CONST: number of lines that your header will occupy
			message = #footer.val, -- CONST: because of padding at the bottom
			length_buttons = #buttons.val * 2 - 1, -- CONST: it calculate the number that buttons will occupy
			neovim_lines = 2, -- CONST: 2 of command line, 1 of the top bar
			padding_between = 3, -- STATIC: can be set to anything, padding between keybinds and header
		}
		local left_terminal_value = vim.api.nvim_get_option("lines")
			- (
				occupied_lines.length_buttons
				+ occupied_lines.message
				+ occupied_lines.padding_between
				+ occupied_lines.icon
				+ occupied_lines.neovim_lines
			)
		local top_padding = math.floor(left_terminal_value / 2)
		local bottom_padding = left_terminal_value - top_padding
		alpha.setup({
			layout = {
				{ type = "padding", val = top_padding },
				header,
				{ type = "padding", val = occupied_lines.padding_between },
				buttons,
				footer,
				{ type = "padding", val = bottom_padding },
			},
			opts = {
				margin = 5,
			},
		})
	end,
}
