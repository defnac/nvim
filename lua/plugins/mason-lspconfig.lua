return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "ts_ls", "omnisharp" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason-lspconfig").setup {
            automatic_enable = true,
        }

        local servers = { "lua_ls" } -- list of servers you want to override
        for _, name in ipairs(servers) do
            local ok, conf = pcall(require, "lsp." .. name)
            if ok then
                vim.lsp.config(name, conf)
            end
        end
    end
}
