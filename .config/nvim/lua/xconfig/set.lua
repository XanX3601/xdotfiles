vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.colorcolumn = "81"
vim.opt.confirm = true
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.fileencodings = "utf-8"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false
vim.opt.writebackup = false

-- formatoptions as autocmd to prevent being override by ftpplugin
vim.api.nvim_create_autocmd(
    {"FileType"},
    {pattern="*", command="set formatoptions-=cro"}
)
