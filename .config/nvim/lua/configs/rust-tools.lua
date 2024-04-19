local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local rt = require("rust-tools")

local options = {
  server = {
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      on_attach(client, bufnr)
    end,
    capabilities = capabilities
  },
  tools = {
    hover_actions = {
      auto_focus = true
    }
  }
}
return options
