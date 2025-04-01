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

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = true,
})

-- Enable each language server by filename under the lsp/ folder
vim.lsp.enable({ "basedpyright", "luals", "clangd", "jsonls", "rust_analyzer", "typescript", "yamlls", "html", "css" })
