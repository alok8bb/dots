return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "tsserver", "solidity_ls_nomicfoundation", "rust_analyzer" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = { globals = {'vim'}}
                    }
                }
            }) 

            local k = vim.keymap
            k.set("n", "K", vim.lsp.buf.hover, {})
        end
    }
}
