-- Language Servers settings.
return {
    "neovim/nvim-lspconfig",
    opts = {},
    dependencies = {
        { -- >>> mason-lspconfig >>>
            -- for automatic installation of language servers
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    -- Here is where you add the language servers you want.
                    -- DO NOT FORGET TO ADD THEM TO THE SOURCES USED FOR NVIM-CMP
                    -- See the line with "sources = cmp.config.sources({"
                    "lua_ls",
                    "ts_ls"
                }
            },
            dependencies = {
                "mason-org/mason.nvim", opts = {}
            },
        }, -- <<< mason-lspconfig
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- nvim-cmp configuration
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                          luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }
                )
            }),
            completion = {
                autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
                keyword_length = 1,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            })
        })

        -- Add the language servers here to enable them
        require("lspconfig").lua_ls.setup({
            capabilities = capabilities
        })
        require("lspconfig").ts_ls.setup({
            capabilities = capabilities
        })
    end,
}
