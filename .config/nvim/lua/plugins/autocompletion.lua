-- auto start coq
vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        jump_to_mark = '<leader>n'
    }
}

-- on attach function triggered when attaching lsp client to a buffer
local on_attach = function(client, buffer)
    vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require'lsp_signature'.on_attach({}, buffer)
    require'nvim-navbuddy'.attach(client, buffer)
end

-- register servers
local servers = {'clangd', 'pyright'}
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup(require('coq').lsp_ensure_capabilities({
    }))
end

-- start lsp signature

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities,
        on_attach=on_attach
        -- you can add other fields for setting up lsp server in this table
    })
end
require('ufo').setup()

vim.api.nvim_create_autocmd('BufRead', {
   callback = function()
      vim.api.nvim_create_autocmd('BufWinEnter', {
         once = true,
         command = 'normal! zx'
      })
   end
})
