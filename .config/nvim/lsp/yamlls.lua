---@type vim.lsp.Config
return {
	cmd = { "yaml-language-server" },
	filetypes = { "yaml", "yml" },
	root_markers = {
		".git",
	},
}
