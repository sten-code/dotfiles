local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "codelldb"
      }
    }
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "codelldb"
      }
    }
  },
}

return plugins
