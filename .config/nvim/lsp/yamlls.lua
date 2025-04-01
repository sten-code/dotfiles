---@type vim.lsp.Config
return {
	cmd = { "yamlls" },
	filetypes = { "yaml", "yml" },
	root_markers = {
		".git",
	},
}
