return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		linters_by_ft = {
			lua = { "selene" },
			luau = { "selene" },
			cpp = { "clangtidy" },
			python = { "pydocstyle", "pylint", "bandit" },
		},
		linters = {
			selene = {
				condition = function(_, bufnr)
					return vim.fs.root(bufnr, "selene.toml")
				end,
			},
		},
	},
	config = function(_, opts)
		local lint = require("lint")
		lint.linters_by_ft = opts.linters_by_ft

		for name, linter in pairs(opts.linters) do
			if type(linter) == "table" and type(lint.linters[name]) == "table" then
				lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
			else
				lint.linters[name] = linter
			end
		end

		local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			group = lint_group,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
