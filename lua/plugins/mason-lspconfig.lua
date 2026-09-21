return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "ts_ls", "omnisharp" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.lsp.config('*', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })

        require("mason-lspconfig").setup {
            automatic_enable = true,
        }

        local servers = { "lua_ls", "ts_ls" } -- list of servers you want to override
        for _, name in ipairs(servers) do
            local ok, conf = pcall(require, "lsp." .. name)
            if ok then
                vim.lsp.config(name, conf)
            end
        end

        -- Force ts_ls to attach to .vue buffers: `vue_ls` needs a running ts_ls
        -- (with @vue/typescript-plugin loaded, see lsp/ts_ls.lua) to handle actual
        -- TS/JS logic. Relying on ts_ls's `filetypes` list alone doesn't reliably
        -- trigger autostart for .vue buffers, so we start it explicitly here.
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "vue",
            callback = function(args)
                local root_dir = vim.fs.root(args.buf, { "package.json", "tsconfig.json", "jsconfig.json" })

                vim.lsp.start(vim.tbl_deep_extend("force", vim.lsp.config.ts_ls, {
                    name = "ts_ls",
                    root_dir = root_dir,
                }))
            end,
        })
    end
}
