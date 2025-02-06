require("config.lazy")

-- Tab config
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Colorscheme
vim.cmd.colorscheme "gruvbox-material"

-- Bindings
vim.g.mapleader = " "
-- format file
vim.api.nvim_set_keymap('i', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })

-- Show line numbers
vim.o.number = true

-- Clipboard
if vim.fn.has('win32') or vim.fn.has('win64') then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }

    -- Enable mouse support
    vim.opt.mouse = 'a'
end
