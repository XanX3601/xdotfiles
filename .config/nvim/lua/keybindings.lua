vim.g.mapleader = ';'

-- buffers
vim.keymap.set('n', '<leader>h', ':bp<cr>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>l', ':bn<cr>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>x', ':BD<cr>', {noremap=true, silent=true})

-- debugger
vim.keymap.set('n', '<F5>', function() require"dap".continue() end)
vim.keymap.set('n', '<F6>', function() require"dap".step_over() end)
vim.keymap.set('n', '<F7>', function() require"dap".step_into() end)
vim.keymap.set('n', '<F8>', function() require"dap".step_out() end)
vim.keymap.set('n', '<F8>', function() require"dap".step_out() end)
vim.keymap.set('n', '<F9>', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>b', function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
vim.keymap.set('n', '<leader>e', function() require"dapui".eval() end)

-- diagnostic
vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, {noremap=true, silent=true})
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next,  {noremap=true, silent=true})
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev,  {noremap=true, silent=true})

-- documentation
vim.keymap.set('n', '<leader>D', vim.lsp.buf.hover, {noremap=true, silent=true})

-- doge
vim.keymap.set('n', '<leader>doc', ':DogeGenerate<cr>')

-- file
vim.keymap.set('n', '<leader>o', ':Vifm<cr>', {noremap=true, silent=true})

-- goto
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration,    {noremap=true, silent=true})
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition,     {noremap=true, silent=true})
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {noremap=true, silent=true})
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references,     {noremap=true, silent=true})

-- resize
vim.keymap.set('n', '<up>',    ':resize +2<cr>',          {noremap=true, silent=true})
vim.keymap.set('n', '<down>',  ':resize -2<cr>',          {noremap=true, silent=true})
vim.keymap.set('n', '<left>',  ':vertical resize +2<cr>', {noremap=true, silent=true})
vim.keymap.set('n', '<right>', ':vertical resize -2<cr>', {noremap=true, silent=true})

-- search
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files,          {noremap=true, silent=true})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep,           {noremap=true, silent=true})
vim.keymap.set('n', '<leader>fr', telescope_builtin.lsp_references,      {noremap=true, silent=true})
vim.keymap.set('n', '<leader>fd', telescope_builtin.lsp_definitions,     {noremap=true, silent=true})
vim.keymap.set('n', '<leader>fi', telescope_builtin.lsp_implementations, {noremap=true, silent=true})

vim.keymap.set('n', '<leader><space>', ':noh<cr>', {noremap=true, silent=true})

-- spelling
vim.keymap.set('n', '<leader>st', ':set spell!<cr>',          {noremap=true, silent=true})
vim.keymap.set('n', '<leader>sf', ':set spelllang=fr<cr>',    {noremap=true, silent=true})
vim.keymap.set('n', '<leader>se', ':set spelllang=ne_us<cr>', {noremap=true, silent=true})

-- split
vim.keymap.set('n', '<leader>v', ':vsplit<cr>', {noremap=true, silent=true})

-- tricks
vim.keymap.set('i', 'kj', '<esc>', {desc='easy escape key'})

-- windows
vim.keymap.set('n', '<c-h>', '<c-W>h', {noremap=true, silent=true})
vim.keymap.set('n', '<c-j>', '<c-W>j', {noremap=true, silent=true})
vim.keymap.set('n', '<c-k>', '<c-W>k', {noremap=true, silent=true})
vim.keymap.set('n', '<c-l>', '<c-W>l', {noremap=true, silent=true})

-- zen
vim.keymap.set('n', '<leader>z', ':ZenMode<cr>', {noremap=true, silent=true})

