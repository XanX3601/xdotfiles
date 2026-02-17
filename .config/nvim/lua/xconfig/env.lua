package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

vim.g.python_host_prog = '/home/azureuser/.nvim-venv/bin/python'
vim.g.python3_host_prog = '/home/azureuser/.nvim-venv/bin/python'
