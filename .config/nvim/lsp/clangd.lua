---@type vim.lsp.Config
return {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--fallback-style=webkit",
	},
	filetypes = { "cpp", "c" },
	root_markers = {
		".git",
		"compile_commands.json",
		"compile_flags.txt",
		".clang-format",
		".clang-tidy",
		".clangd",
	},
}
