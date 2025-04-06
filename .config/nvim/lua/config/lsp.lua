vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, opts)
		vim.keymap.set("i", "<c-b>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	end,
})

-- This is copied straight from blink
-- https://cmp.saghen.dev/installation#merging-lsp-capabilities
local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- Setup language servers.

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

local config = require("config")
vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = config.icons.diagnostics.error,
			[vim.diagnostic.severity.WARN] = config.icons.diagnostics.warn,
			[vim.diagnostic.severity.HINT] = config.icons.diagnostics.hint,
			[vim.diagnostic.severity.INFO] = config.icons.diagnostics.info,
		},
		texthl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		},
	},
})

-- Enable each language server by filename under the lsp/ folder
vim.lsp.enable({
	"basedpyright",
	"luals",
	"clangd",
	"jsonls",
	"typescript",
	"yamlls",
	"html",
	"css",
	"arduinols",
	"asm-lsp",
})
