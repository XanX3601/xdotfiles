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

    " popup menu
    " to be able to use popup menu
    Plug 'kamykn/popup-menu.nvim'

    " vim dadbod
    " to make sql query through vim
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui'

    " jupyter ascending
    " to interact with jupyter notebook
    Plug 'untitled-ai/jupyter_ascending.vim'

    " vim table mode
    " to make nice markdown table
    Plug 'dhruvasagar/vim-table-mode'

    " markdown preview
    " to have preview of markdown files
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
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

" vim dadbod
" thanks to https://habamax.github.io/2019/09/02/use-vim-dadbod-to-query-databases.html
" all the code for vim dadbod comes from there, amazing !
let g:db_ui_use_nerd_fonts = 1

func! DBExe(...)
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    endif

    let sel_save = &selection
    let &selection = 'inclusive'
    let reg_save = @@

    if a:1 == 'char'
        silent exe 'normal! gvy'
    elseif a:1 == 'line'
        silent exe "normal! '[V']y"
    else
        silent exe 'normal! `[v`]y'
    endif

    execute 'DB ' . @@

    let &selection = sel_save
    let @@ = reg_save
endfunc

let g:dbs = {
\}

let g:db = ''

func! DBSelected(selected)
    if a:selected != ""
        let b:db = g:dbs[a:selected]
        echo 'DB ' . a:selected . ' is selected'
    endif
endfunc

command! DBSelect :call popup_menu#open(
    \keys(g:dbs),
    \{db -> DBSelected(db)},
    \{
        \'relative': 'editor',
        \'width': 80,
        \'height': 20,
        \'col': (&columns/2) - 40,
        \'row': (&lines/2) - 10
    \}
\)

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
" execute sql query
xnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExeLine) DBExe() . '_'

xmap <leader>db  <Plug>(DBExe)
nmap <leader>db  <Plug>(DBExe)
omap <leader>db  <Plug>(DBExe)
nmap <leader>dbb <Plug>(DBExeLine)
" center view horizontally
nmap <silent>zh zszH
" jupyter notebook
nmap <space><space>x <Plug>JupyterExecute
nmap <space><space>X <Plug>JupyterExecuteAll
