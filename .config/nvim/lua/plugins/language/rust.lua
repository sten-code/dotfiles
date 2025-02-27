return {
    {
        "Saecki/crates.nvim",
        tag = "stable",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup({
                completion = {
                    cmp = {
                        enabled = true
                    }
                }
            })
        end,
    },
    -- {
    --     "mrcjkb/rustaceanvim",
    --     version = "^5", -- Recommended
    --     lazy = false, -- This plugin is already lazy
    -- },
}
