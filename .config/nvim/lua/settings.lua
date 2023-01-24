vim.o.autoindent = true                    -- follow indentation from previous line
vim.o.autoread = true                      -- read files that have changed outside vim
vim.o.background = "dark"                  -- use dark background
vim.o.colorcolumn = "81"                   -- color column 81
vim.o.confirm = true                       -- ask wether to save files or not upon exit
vim.o.copyindent = true                    -- make autoindent copy the existing indent
vim.o.dictionary = "/usr/share/dict/words" -- add words to help autocompletion
vim.o.diffopt = "filler," ..               -- add filler line when using diff mode
                "vertical," ..             -- start diff mode with vertical split
                "closeoff," ..             -- turns off diff mode when closing one window and only one remains
                "followwrap," ..           -- follow the wrap option
                "internal"                 -- use internal library
vim.o.expandtab = true                     -- to use space instead of tabs
vim.o.fileencodings = "utf-8"              -- only use utf8 when discovering a file encoding
vim.o.foldlevel = 99                       -- to not have anything folded by default
vim.o.foldmethod = "indent"                -- fold line using indentation level
vim.cmd(
    "autocmd BufEnter * set formatoptions-=cro"
)
vim.cmd(
    "autocmd BufEnter * setlocal formatoptions-=cro"
)
vim.o.ignorecase = true                    -- search is not case sensitive
vim.o.number = true                        -- display number of line on the left of the window
vim.o.relativenumber = true                -- display relative line number
vim.o.shiftwidth = 4                       -- shifting line indentation by 4 spaces
vim.o.shortmess = vim.o.shortmess .. "c"   -- add option to hitting enter upon some situation
vim.o.signcolumn = "number"                -- display sign column
vim.o.smartcase = true                     -- search is case sensitive if an upper letter is used
vim.o.softtabstop = 4                      -- a tab takes the same place as 4 spaces while editing
vim.o.splitbelow = true                    -- when splitting horizontal, place the new window under the current one
vim.o.splitright = true                    -- when splitting verticaly, place the new window right the to current one
vim.o.syntax = "ON"                        -- enable syntax highlightning
vim.o.swapfile = false                     -- no swap file
vim.o.tabstop = 4                          -- one tabulation takes the same place as 4 spaces
vim.o.termguicolors = true                 -- use true colors
vim.o.wildmode = "longest:full,full"       -- completion mode
vim.o.wrap = false                         -- do not wrap lines
vim.o.writebackup = false                  -- no backup before overwritting a file
