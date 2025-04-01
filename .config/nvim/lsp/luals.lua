---@type vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".git",
		".luarc.json",
		".luarc.jsonc",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
		".stylua.toml",
		".luacheckrc",
	},
}
