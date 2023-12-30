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
    -- dadbod
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    -- vim accent
    use 'XanX3601/vim-accent'
    -- markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end
    })
    -- pets
    use({
        "giusgad/pets.nvim",
        requires = {
            "giusgad/hologram.nvim",
            "MunifTanjim/nui.nvim",
        }
    })
    -- vim table mode
    use 'dhruvasagar/vim-table-mode'
    -- indent blank line
    use "lukas-reineke/indent-blankline.nvim"
    -- leap
    use 'ggandor/leap.nvim'
    -- no neck pain
    use 'shortcuts/no-neck-pain.nvim'
    -- catppucin
    use { "catppuccin/nvim", as = "catppuccin" }
    -- navbuddy
    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",        -- Optional
            "nvim-telescope/telescope.nvim" -- Optional
        }
    }
    -- rainbow parenthesis
    use 'HiPhish/nvim-ts-rainbow2'
    -- nvim-ufo
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    -- git blame
    use 'f-person/git-blame.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
