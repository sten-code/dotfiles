local MAX_ABBR_WIDTH = 30
local MAX_MENU_WIDTH = 30

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opts = function()
        local cmp = require("cmp")

        return {
            mapping = {
                ["<c-n>"] = cmp.mapping.select_next_item(),
                ["<c-p>"] = cmp.mapping.select_prev_item(),
                ["<c-u>"] = cmp.mapping.scroll_docs(-4),
                ["<c-d>"] = cmp.mapping.scroll_docs(4),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ["<c-e>"] = cmp.mapping.abort(),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "snippets" },
            }, {
                { name = "buffer", keyword_length = 4 },
            }),
            formatting = {
                format = function(_, item)
                    if vim.api.nvim_strwidth(item.abbr) > MAX_ABBR_WIDTH then
                        item.abbr = vim.fn.strcharpart(item.abbr, 0, MAX_ABBR_WIDTH) .. "…"
                    end
                    if vim.api.nvim_strwidth(item.menu or "") > MAX_MENU_WIDTH then
                        item.menu = vim.fn.strcharpart(item.menu, 0, MAX_MENU_WIDTH) .. "…"
                    end
                    return item
                end,
            },
        }
    end,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        {
            "garymjr/nvim-snippets",
            opts = {},
        },
    },
}
