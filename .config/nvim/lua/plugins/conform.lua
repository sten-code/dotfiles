return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"gf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			json = { "prettierd" },
			lua = { "stylua" },
			luau = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			rust = { "rustfmt", lsp_format = "fallback" },
		},
		format_on_save = function()
			if vim.g.autoformat then
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end
		end,
	},
	init = function()
		vim.g.autoformat = true
	end,
}
