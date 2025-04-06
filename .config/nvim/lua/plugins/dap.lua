return {
	{
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		config = function()
			require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle breakpoint on current line",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue the program",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step into",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<leader>dq",
				function()
					require("dap").terminate()
				end,
				desc = "Quit debugging",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup({})
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				commented = true, -- Show virtual text alongside comment
			})

			vim.diagnostic.config({
				signs = {
					text = {
						["DapBreakpoint"] = "",
						["DapBreakpointRejected"] = "",
						["DapStopped"] = "",
					},
					texthl = {
						["DapBreakpoint"] = "DiagnosticSignError",
						["DapBreakpointRejected"] = "DiagnosticSignError",
						["DapStopped"] = "DiagnosticSignWarn",
					},
					linehl = {
						["DapStopped"] = "Visual",
					},
					numhl = {
						["DapStopped"] = "DiagnosticSignWarn",
					},
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
