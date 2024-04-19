---@type ChadrcConfig
local M = {}


M.ui = {
  theme = "catppuccin",
  transparency = true
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

-- vim.api.nvim_command("hi normal guibg=NONE")

return M
