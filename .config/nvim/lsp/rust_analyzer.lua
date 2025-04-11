---@type vim.lsp.Config
return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = {
		".git",
	},
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
				extraArgs = { "--no-deps" },
			},
		},
	},
}
