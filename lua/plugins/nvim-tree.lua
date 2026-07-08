return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree", silent = true },
    },
    opts = {
        filters = {
            dotfiles = false,
            git_ignored = false,
        },
    },
}
