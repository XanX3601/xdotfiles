require'nvim-treesitter.configs'.setup {
    auto_install = false,
    highlight = {
        enable = true
    },
    indent = {
        enable = false
    }
}

-- let tree sitter handle the folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false
