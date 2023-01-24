local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
    return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- the package manager
    use 'wbthomason/packer.nvim'

    -- hightlight colors in text
    use 'norcalli/nvim-colorizer.lua' 
    -- colorscheme
    use 'sainnhe/everforest'
    -- better syntax highlithing
    use 'nvim-treesitter/nvim-treesitter' -- better syntax highlithing
    -- lsp config
    use 'neovim/nvim-lspconfig'
    -- coq to have autocompletion
    use 'ms-jpq/coq_nvim'
    use 'ms-jpq/coq.artifacts'
    use 'ms-jpq/coq.thirdparty'
    -- lsp signature to have method signature while typing (coq does not do it)
    use 'ray-x/lsp_signature.nvim'
    -- telescope
    use 'nvim-lua/plenary.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-telescope/telescope.nvim'
    -- bufferline
    -- use 'nvim-tree/nvim-web-devicons' -- already above
    use 'akinsho/bufferline.nvim'
    -- buffkill
    use 'qpkorr/vim-bufkill'
    -- zen mode
    use 'folke/zen-mode.nvim'
    use 'folke/twilight.nvim'
    -- todo comments
    use 'folke/todo-comments.nvim'
    -- auto pairs
    use 'windwp/nvim-autopairs'
    -- vifm
    use 'vifm/vifm.vim'
    -- feline
    use 'feline-nvim/feline.nvim'
    -- vim codefmt
    use 'google/vim-maktaba'
    use 'google/vim-codefmt'
    use 'google/vim-glaive'
    -- python indent
    use 'Vimjas/vim-python-pep8-indent'
    -- doge
    use {'kkoomen/vim-doge', run = ':call doge#install()'}
    -- nvim dap
    use 'mfussenegger/nvim-dap'
    -- nvim dap ui
    use 'rcarriga/nvim-dap-ui'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
