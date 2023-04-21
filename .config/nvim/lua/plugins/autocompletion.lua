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
        on_attach=on_attach
    }))
end

-- start lsp signature
