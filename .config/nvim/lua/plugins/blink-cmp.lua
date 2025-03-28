return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	-- use a release tag to download pre-built binaries
	version = "*",

	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<C-n>"] = { "select_next" },
			["<C-p>"] = { "select_prev" },
			["<Tab>"] = { "select_and_accept", "fallback" },
			-- ["<CR>"] = { "accept", "fallback" },
		},
		cmdline = {
			keymap = {
				["<CR>"] = {}, -- Without this, enter will put in the suggestion of the autocompletion of the command
				["<Tab>"] = { "select_and_accept", "fallback" },
			},
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},

		-- Shows a signature of the function when inputting parameters, press <C-space> to pull up the signature.
		signature = {
			enabled = true,
			window = {
				border = "rounded",
				show_documentation = true,
			},
		},

		completion = {
			trigger = {
				show_on_trigger_character = true,
				show_on_insert_on_trigger_character = true,
				show_on_x_blocked_trigger_characters = { "'", '"', "(", "{", "[" },
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = "rounded",
				},
			},
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets" },
		},
	},
	opts_extend = { "sources.default" },
}
