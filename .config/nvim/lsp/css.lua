---@type vim.lsp.Config
return {
	cmd = { "cssls" },
	filetypes = { "css" },
	root_markers = {
		".git",
	},
}
