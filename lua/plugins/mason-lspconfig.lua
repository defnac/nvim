return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {"ts_ls", "omnisharp"},
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    }
}
