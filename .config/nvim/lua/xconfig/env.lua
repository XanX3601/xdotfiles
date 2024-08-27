package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

vim.g.python_host_prog = '/Users/petiteau/.nvim-venv/bin/python'
vim.g.python3_host_prog = '/Users/petiteau/.nvim-venv/bin/python'
