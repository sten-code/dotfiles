---@type vim.lsp.Config
return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = {
		".git",
	},
	settings = {
		json = {
			schemas = require("schemastore").json.schemas({
				extra = {
					{
						name = "default.project.json",
						description = "JSON schema for Rojo project files",
						fileMatch = { "*.project.json" },
						url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
					},
				},
			}),
			validate = {
				enable = true,
			},
		},
	},
}
