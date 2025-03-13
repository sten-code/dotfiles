return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			-- Python
			basedpyright = {},

			-- ruff = {
			-- 	on_attach = function(client)
			-- 		client.server_capabilities.hoverProvider = false
			-- 	end,
			-- },

			-- pylsp = {
			-- 	settings = {
			-- 		pylsp = {
			-- 			plugins = {
			-- 				pyls_mypy = { enabled = true }, # pip install pyls-mypy
			-- 				pylint = { enabled = true, executable = "pylint" },
			-- 				-- pyflakes = { enabled = false },
			-- 				-- pycodestyle = { enabled = false },
			-- 			},
			-- 		},
			-- 	},
			-- },

			-- C/C++
			clangd = {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=detailed",
					"--header-insertion=iwyu",
					"--fallback-style=webkit",
				},
			},

			-- CSS/HTML
			cssls = {},
			html = {},

			-- JavaScript
			eslint = {},

			-- TypeScript
			vtsls = {
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
			},

			jsonls = function()
				return {
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
			end,

			lua_ls = {},

			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
							extraArgs = { "--no-deps" },
						},
					},
				},
			},

			yamlls = {},
		},
	},
	config = function(_, opts)
		local capabilities = require("lsp").capabilities()
		local lspconfig = require("lspconfig")

		for server, config in pairs(opts.servers) do
			config = type(config) == "function" and config() or config
			config.capabilities = capabilities
			lspconfig[server].setup(config)
		end
	end,
	dependencies = {
		"b0o/SchemaStore.nvim",
	},
}
