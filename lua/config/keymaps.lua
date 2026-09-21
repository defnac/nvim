-- Format file
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true })

-- Diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })

-- Code action
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })

-- LSP-powered keymaps: only apply in buffers where a language server has attached
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, noremap = true, silent = true })
  end,
})

-- Search restricted to visual selection: select text, press "/", type your term
vim.keymap.set('x', '/', '<Esc>/\\%V', { noremap = true })
