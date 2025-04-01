---@type vim.lsp.Config
return {
	cmd = { "vtsls" },
	filetypes = { "ts", "js" },
	root_markers = {
		".git",
	},
	settings = {
		typescript = {
			updateImportsOnFileMove = "always",
		},
		javascript = {
			updateImportsOnFileMove = "always",
		},
		vtsls = {
			enableMoveToFileCodeAction = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
	},
}
