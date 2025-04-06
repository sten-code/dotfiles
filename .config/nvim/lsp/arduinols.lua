---@type vim.lsp.Config
return {
	cmd = { "arduino-language-server" },
	filetypes = { "arduino" },
	settings = {
		textDocument = {
			semanticTokens = vim.NIL,
		},
		workspace = {
			semanticTokens = vim.NIL,
		},
	},
}
