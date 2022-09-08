" Plugins *********************************************************************
call plug#begin(stdpath('data') . '/plugged')
    " coq
    " fast autocompletion
    Plug 'ms-jpq/coq_nvim',       {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts',  {'branch': 'artifacts'}
    Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

    " dracula
    " the color scheme
    Plug 'dracula/vim', { 'as': 'dracula' }

    " nvim lspconfig
    " native lsp config needed to run lang server
    Plug 'neovim/nvim-lspconfig'

    " tree sitter
    " to have beautiful syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " vifm
    " to move around files
    Plug 'vifm/vifm.vim'

    " vim bufkill
    " to close buffers
    Plug 'qpkorr/vim-bufkill'

    " vim buftabline
    " to display the name of opened buffers on top
    Plug 'ap/vim-buftabline'

    " telescope
    " fuzzy finder
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " todo-comments
    " to enhance todos in code
    " Plug 'nvim-lua/plenary.nvim' " already above
    Plug 'folke/todo-comments.nvim'
call plug#end()

" coq
let g:coq_settings = {'auto_start': 'shut-up', 'keymap.jump_to_mark': '<C-n>'}

lua << EOF
    local lsp = require 'lspconfig'
    local coq = require 'coq'

    lsp.pyright.setup(coq.lsp_ensure_capabilities())
EOF

" tree sitter
lua << EOF
    require'nvim-treesitter.configs'.setup{
        highlight = {
            enable = true
        },
        indent = {
            enable = true,
            disable = {"python"}
        }
    }
EOF

" todo-comments
lua << EOF
    require("todo-comments").setup{
    }
EOF

" General settings *************************************************************
set encoding=UTF-8 " encoding file to utf8
filetype plugin indent on " Enable detection, plugin and indent
syntax enable " enable syntax highlighting
set autoread " auto re-read files that have been changed outside nvim
set spelllang=en_us " spell check as English
set hidden " hide file buffers when opening new files instead of closing them
set nowrap " no wrap line, just one long big line
" menu for command line completion
set wildmenu
set wildmode=longest:full,full
set backspace=indent,eol,start " backspace behave like a normal backspace
set confirm " prompt question instead of printing errors on commands like :q
" a tab is worth 4 spaces
set shiftwidth=4 
set tabstop=4
set softtabstop=4
set expandtab
" prevent inserting comments on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set hls " highlight all matches from previous search pattern
set is " highlight all matches for search pattern as you type it
set ic " ignore case for search pattern
set laststatus=2 " always print line status
set cmdheight=1 " number of line for the command line
set splitbelow " when splitting horizontal, put the new window under the current one
set splitright " when splitting vertical, put the new window to the right of the current one
" no backup
set nobackup
set nowritebackup
set number " display the current line number
set relativenumber " display the relative line number
set colorcolumn=81 " display a bar on the right to limit at 80 char
set cursorline " highlight current line
set updatetime=300 " more frequent update time (recommended by coc)
set shortmess+=c " remove some message to avoid spamming by coc
set signcolumn=number " display sign column on the number one
set noswapfile " remove swap files

" Colorscheme ******************************************************************
set background=dark
set termguicolors
colorscheme dracula
" hi Normal guibg=#1D1F26 ctermbg=black
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" Status line ******************************************************************
set statusline=
set statusline+=%#PmenuSbar# " left side color
set statusline+=\ %M " is file modified
set statusline+=\ %y " file type
set statusline+=\ %r " is file read only
set statusline+=\ %F " full path to file
set statusline+=%= " go to right side
set statusline+=%#PmenuSel# " right side color
set statusline+=\ %c:%l/%L " position in the file
set statusline+=\ %p%% " seen percentage of the file
set statusline+=\ [%n] " buffer number

" Key bindings *****************************************************************
let mapleader=";" " map leader to comma
" open split
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
" resize windows with arrow keys
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" move around split with control + direction
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
" move around buffers
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>x :BD<CR>
" spell check
nnoremap <leader>sf :set spelllang=fr<CR>
nnoremap <leader>se :set spelllang=en_us<CR>
nnoremap <leader>st :set spell!<CR>
" search
nnoremap <leader><space> :noh<CR>
" esc
inoremap kj <esc>
" open file
nnoremap <leader>o :Vifm<CR>
" find file
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
" todo
autocmd FileType python nnoremap todo a#TODO: 
