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
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true })
-- diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })
-- code action
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })

-- Show line numbers
vim.o.number = true

-- Clipboard
if vim.fn.has('wsl') == 1 then
    -- WSL 2 configuration using Windows executables
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
elseif vim.fn.has('linux') == 1 then
    -- Native Linux (Ubuntu) configuration
    -- Neovim will automatically use xclip, xsel, or wl-copy if installed on your system.
    vim.opt.clipboard = 'unnamedplus'
elseif vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    -- Native Windows configuration
    vim.opt.clipboard = 'unnamedplus'
end

-- Enable mouse support
vim.opt.mouse = 'a'
