vim.g.mapleader = ';'

-- buffers
vim.keymap.set('n', '<leader>h', ':bp<cr>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>l', ':bn<cr>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>x', ':BD<cr>', {noremap=true, silent=true})

-- copy / past
vim.keymap.set('v', '<leader>y', '"+y', {noremap=true, silent=true})
vim.keymap.set('v', '<leader>p', '"+p', {noremap=true, silent=true})

-- escape
vim.keymap.set('i', 'kj', '<esc>', {desc='easy escape key'})

-- resize
vim.keymap.set('n', '<up>',    ':resize +2<cr>',          {noremap=true, silent=true})
vim.keymap.set('n', '<down>',  ':resize -2<cr>',          {noremap=true, silent=true})
vim.keymap.set('n', '<left>',  ':vertical resize +2<cr>', {noremap=true, silent=true})
vim.keymap.set('n', '<right>', ':vertical resize -2<cr>', {noremap=true, silent=true})

-- search
vim.keymap.set('n', '<leader><space>', ':noh<cr>', {noremap=true, silent=true})

-- split
vim.keymap.set('n', '<leader>v', ':vsplit<cr>', {noremap=true, silent=true})

-- windows
vim.keymap.set('n', '<c-h>', '<c-W>h', {noremap=true, silent=true})
vim.keymap.set('n', '<c-j>', '<c-W>j', {noremap=true, silent=true})
vim.keymap.set('n', '<c-k>', '<c-W>k', {noremap=true, silent=true})
vim.keymap.set('n', '<c-l>', '<c-W>l', {noremap=true, silent=true})

