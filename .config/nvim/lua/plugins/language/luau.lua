return {
	"lopi-py/luau-lsp.nvim",
	ft = "luau",
	opts = function()
		local capabilities = require("lsp").capabilities()

		return {
			platform = {
				type = "roblox",
			},
			server = {
				capabilities = capabilities,
				settings = {
					["luau-lsp"] = {
						completion = {
							imports = {
								enabled = true,
							},
						},
						require = {
							mode = "relativeToFile",
							directoryAliases = require("luau-lsp").aliases(),
						},
						inlayHints = {
							functionReturnTypes = true,
							parameterTypes = true,
						},
					},
				},
			},
		}
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
