accent = false

vim.keymap.set('n', '<c-a>', function()
    if accent then
        vim.keymap.del('i', 'aa')
        vim.keymap.del('i', 'cc')
        vim.keymap.del('i', 'ee')
        vim.keymap.del('i', 'ii')
        vim.keymap.del('i', 'uu')
    else
        vim.keymap.set('i', 'aa', 'a<esc><plug>(accent)a')
        vim.keymap.set('i', '<leader>a', '<esc><plug>(accent)a')
        vim.keymap.set('i', 'cc', 'c<esc><plug>(accent)a')
        vim.keymap.set('i', '<leader>k', '<esc><plug>(accent)a')
        vim.keymap.set('i', 'ee', 'e<esc><plug>(accent)a')
        vim.keymap.set('i', '<leader>e', '<esc><plug>(accent)a')
        vim.keymap.set('i', 'ii', 'i<esc><plug>(accent)a')
        vim.keymap.set('i', '<leader>i', '<esc><plug>(accent)a')
        vim.keymap.set('i', 'uu', 'u<esc><plug>(accent)a')
        vim.keymap.set('i', '<leader>u', '<esc><plug>(accent)a')
    end
    accent = not accent
end)

