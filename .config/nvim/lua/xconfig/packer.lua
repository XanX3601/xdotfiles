local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd "packadd packer.nvim"
end

packer = require("packer")
return packer.startup(
    function(use)
        -- accent
        -- accent mode to make it easier to type in french
        use {
            "XanX3601/vim-accent",
            config = function()
                accent = false

                vim.keymap.set(
                    "n",
                    "<c-a>",
                    function()
                        if accent then
                            vim.keymap.del("i", "aa")
                            vim.keymap.del("i", "<leader>a")
                            vim.keymap.del("i", "cc")
                            vim.keymap.del("i", "<leader>c")
                            vim.keymap.del("i", "ee")
                            vim.keymap.del("i", "<leader>e")
                            vim.keymap.del("i", "ii")
                            vim.keymap.del("i", "<leader>i")
                            vim.keymap.del("i", "oo")
                            vim.keymap.del("i", "<leader>o")
                            vim.keymap.del("i", "uu")
                            vim.keymap.del("i", "<leader>u")
                        else
                            vim.keymap.set("i", "aa", "a<esc><plug>(accent)a")
                            vim.keymap.set("i", "<leader>a", "<esc><plug>(accent)a")
                            vim.keymap.set("i", "cc", "c<esc><plug>(accent)a")
                            vim.keymap.set("i", "<leader>c", "<esc><plug>(accent)a")
                            vim.keymap.set("i", "ee", "e<esc><plug>(accent)a")
                            vim.keymap.set("i", "<leader>e", "<esc><plug>(accent)a")
                            vim.keymap.set("i", "ii", "i<esc><plug>(accent)a")
                            vim.keymap.set("i", "<leader>i", "<esc><plug>(accent)a")
                            vim.keymap.set("i", "oo", "o<esc><plug>(accent)a")
                            vim.keymap.set("i", "<leader>o", "<esc><plug>(accent)a")
                            vim.keymap.set("i", "uu", "u<esc><plug>(accent)a")
                            vim.keymap.set("i", "<leader>u", "<esc><plug>(accent)a")
                        end
                        accent = not accent
                    end
                )
            end
        }

        -- autopairs
        -- auto pair completion
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        }

        -- bufferline
        -- nice buffer line
        use {
            "akinsho/bufferline.nvim",
            after = {
                "nvim-web-devicons"
            },
            config = function()
                require("bufferline").setup({})
            end
        }

        -- bufkill
        -- to close a buffer easily with one simple command
        use {
            "qpkorr/vim-bufkill",
            config = function()
                vim.keymap.set("n", "<leader>x", ":BD<cr>")
            end
        }

        -- catppuccin
        -- colorscheme
        use {
            "catppuccin/nvim",
            config = function()
                require("catppuccin").setup({
                    flavour = "mocha",
                    transparent_background = true,
                    integrations = {
                        indent_blankline = {
                            enabled = true,
                            colored_indent_levels = true
                        }
                    },
                    leap = true,
                    mason = true,
                    dap = true,
                    dap_ui = true,
                    native_lsp = {
                        enabled = true
                    },
                    telescope = {
                        enabled = true
                    }
                })
            end
        }

        -- colorizer
        -- show color for color string
        use {
            "NvChad/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup({})
            end
        }

        -- dap
        -- debugger protocol
        use {
            "mfussenegger/nvim-dap",
        }

        -- dap python
        -- python config for dap
        use {
            "mfussenegger/nvim-dap-python",
            after = {
                "nvim-dap"
            },
            config = function()
                require("dap-python").setup("/home/azureuser/Repositories/invoice-entry.tpetiteau/venv/bin/python")
            end
        }

        -- dap ui
        -- ui for dap
        use {
            "rcarriga/nvim-dap-ui",
            after = {
                "nvim-dap",
                "nvim-dap-python",
                "nvim-nio"
            },
            config = function()
                require("dapui").setup({})

                local opts = { noremap=true, silent=true }

                vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".continue()<CR>', opts)
                vim.api.nvim_set_keymap('n', '<F6>', ':lua require"dap".step_over()<CR>', opts)
                vim.api.nvim_set_keymap('n', '<F7>', ':lua require"dap".step_into()<CR>', opts)
                vim.api.nvim_set_keymap('n', '<F8>', ':lua require"dap".step_out()<CR>', opts)
                vim.api.nvim_set_keymap('n', '<Leader>b', ':lua require"dap".toggle_breakpoint()<CR>', opts)
                vim.api.nvim_set_keymap('n', '<Leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
                vim.api.nvim_set_keymap('n', '<Leader>lp', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
                vim.api.nvim_set_keymap('n', '<Leader>dr', ':lua require"dap".repl.open()<CR>', opts)
                vim.api.nvim_set_keymap('n', '<Leader>dl', ':lua require"dap".run_last()<CR>', opts)
                vim.api.nvim_set_keymap('n', '<Leader>du', ':lua require"dapui".toggle()<CR>', opts)
            end
        }

        -- dbee
        -- database interaction
        use {
            "kndndrj/nvim-dbee",
            run = function()
                require("dbee").install()
            end,
            after = {
                "nui.nvim"
            },
            config = function()
                require("dbee").setup({})

                vim.keymap.set("n", "<leader>db", ":lua require('dbee').open()<cr>")
            end
        }

        -- diffview
        -- easier merge management
        use {
            "sindrets/diffview.nvim",
            config = function()
                require("diffview").setup({
                    keymaps = {
                        disable_defaults = false
                    },
                    view = {
                        merge_tool = {
                            layout = "diff3_mixed"
                        }
                    }
                })
            end
        }

        -- evergarden
        -- colorscheme to test
        use {
            "comfysage/evergarden",
            config = function()
                require("evergarden").setup({
                    transparent_background = true,
                    constrast_dark = "hard"
                })
            end
        }

        -- flow
        -- colorscheme to test on transparent
        use {
            "0xstepit/flow.nvim",
            config = function()
                require("flow").setup({
                    transparent = true,
                    fluo_color = "pink",
                    mode = "normal",
                    aggressive_spell = false,
                })
            end
        }

        -- friendly snippets
        -- snippets collection
        use {
            "rafamadriz/friendly-snippets",
            after = {
                "LuaSnip",
            },
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end
        }

        -- git blame
        -- git blame in neovim
        use {
            "f-person/git-blame.nvim",
            config = function()
                require("gitblame").setup({
                    enabled = false
                })
            end
        }

        -- indent blankline
        -- identation guide
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("ibl").setup({})
            end
        }

        -- illuminate
        -- highligh current word
        use {
            "RRethy/vim-illuminate"
        }

        -- kitty scrollback
        -- use to display kitty buffer in neovim
        use {
            'mikesmithgh/kitty-scrollback.nvim',
            opt = true,
            cmd = {
                "KittyScrollbackGenerateKittens",
                "KittyScrollbackCheckHealth"
            },
            event = {
                "User KittyScrollbackLaunch"
            },
            config = function()
                require("kitty-scrollback").setup({})
            end,
        }

        -- lackluster
        -- grey colorscheme I want to try
        use {
            "slugbyte/lackluster.nvim"
        }

        -- leap
        -- jump arround the buffer using s and S
        use {
            "ggandor/leap.nvim",
            after = {
                "vim-repeat"
            },
            config = function()
                require("leap").add_default_mappings()
            end
        }

        -- lspconfig
        -- lsp configuration
        use {
            "neovim/nvim-lspconfig",
            after = {
                "mason-lspconfig.nvim"
            },
            config = function()
                local lspconfig = require("lspconfig")
                
                capabilities = require('cmp_nvim_lsp').default_capabilities()

                lspconfig.pyright.setup({
                    capabilities = capabilities,
                    settings = {
                        python = {
                            analysis = {
                                autoSearchPaths = true,
                                typeCheckingMode = "basic",
                                diagnosticMode = "openFilesOnly",
                                useLibraryCodeForTypes = true,
                            }
                        }
                    }
                })
                lspconfig.ruff.setup({
                    capabilities = capabilities,
                })

                local opts = {noremap=true, silent=true}
                vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, opts)
            end
        }

        -- lualine
        -- status line configuration
        use {
            "nvim-lualine/lualine.nvim",
            after = {
                "nvim-web-devicons"
            },
            config = function()
                require("lualine").setup({
                    options = {
                        theme = "catppuccin"
                    }
                })

                vim.cmd [[colorscheme catppuccin]]
            end
        }

        -- lua snip
        -- snippet engine
        use {
            "L3MON4D3/LuaSnip",
            config = function()
                require("luasnip").setup({
                    history = true,
                    updateevents = "TextChanged,TextChangedI",
                })
            end
        }

        -- markdown preview
        -- view markdown file live on browser
        use {
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function()
                vim.g.mkdp_filetypes = {"markdown"}
            end,
            ft = {"markdown"}
        }

        -- mason
        -- to install lsp server, formatter, debugger, ...
        use {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup({})
            end
        }

        -- mason lspconfig
        -- to make mason and lspconfig work together
        use {
            "williamboman/mason-lspconfig.nvim",
            after = {
                "mason.nvim"
            },
            config = function()
                require("mason-lspconfig").setup({})
            end
        }

        -- molten
        -- run python code in neovim
        use {
            "benlubas/molten-nvim",
            run = ":UpdateRemotePlugins",
            config = function()
                vim.g.molten_image_provider = "null"
                vim.g.molten_virt_text_output = true

                vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>")
                vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>")
                vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>")
                vim.keymap.set("v", "<leader>mv", ":<c-u>MoltenEvaluateVisual<CR>")
                vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>")
                vim.keymap.set("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>")
            end
        }

        -- nio
        -- library for asynchronous i/o
        -- used by dap ui
        use {
            "nvim-neotest/nvim-nio"
        }

        -- no neck pain
        -- avoid neck pain
        use {
            "shortcuts/no-neck-pain.nvim",
            config = function()
                require("no-neck-pain").setup({
                    autocmds = {
                        enableOnVimEnter = true,
                        reloadOnColorSchemeChange = false
                    },
                    buffers = {
                        right = {
                            enabled = false
                        },
                        biend = -0.2,
                        scratchPad = {
                            enabled = true,
                            location = "~/Documents"
                        },
                        bo = {
                            filetype = "md"
                        }
                    }
                })

                vim.keymap.set("n", "<leader>nn", ":NoNeckPain<cr>")
            end
        }

        -- nui
        -- library used by plugins
        -- used by dbee
        use {
            "MunifTanjim/nui.nvim"
        }

        -- nvim-cmp
        -- auto completion
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
            },
            after = {
                "LuaSnip",
            },
            config = function()
                local cmp = require("cmp")
                local luasnip = require("luasnip")

                require("luasnip.loaders.from_vscode").lazy_load()

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end,
                    },
                    mapping = {
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.close(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                        ["<Tab>"] = cmp.mapping(
                            function(fallback)
                                if cmp.visible() then
                                    cmp.select_next_item()
                                elseif luasnip.expand_or_jumpable() then
                                    luasnip.expand_or_jump()
                                else
                                    fallback()
                                end
                            end,
                            { "i", "s" }
                        ),
                        ['<S-Tab>'] = cmp.mapping(
                            function(fallback)
                                if cmp.visible() then
                                    cmp.select_prev_item()
                                elseif luasnip.jumpable(-1) then
                                    luasnip.jump(-1)
                                else
                                    fallback()
                                end
                            end,
                            { "i", "s" }
                        ),
                    },
                    sources = cmp.config.sources(
                        {
                            {name = "nvim_lsp"},
                            {name = "luasnip"},
                        },
                        {
                            {name = "buffer"}
                        }
                    )
                })

                cmp.setup.cmdline(
                    {"/", "?"},
                    {
                        sources = {
                            {name = "buffer"}
                        }
                    }
                )

                cmp.setup.cmdline(
                    ":",
                    {
                        sources = cmp.config.sources(
                            {
                                {name = "path"},
                            },
                            {
                                {name = "cmdline"}
                            }
                        )
                    }
                )
            end
        }

        -- packer
        -- plugin manager that manages itself
        use {
            "wbthomason/packer.nvim"
        }

        -- plenary
        -- library used by plugins
        -- used by avante, none ls, todo comments, telescope
        use {
            "nvim-lua/plenary.nvim"
        }

        -- precognition
        -- hightlight movement hint to learn move aroung
        use {
            "tris203/precognition.nvim",
            config = function()
                vim.keymap.set("n", "<leader>pp", ":lua require('precognition').toggle()<CR>")
            end
        }

        -- promise async
        -- library used by ufo
        use {
            "kevinhwang91/promise-async"
        }

        -- rainbow delimiters
        -- highlight delimiters with different colors based on treesitter
        use {
            "HiPhish/rainbow-delimiters.nvim",
            config = function()
                require("rainbow-delimiters.setup").setup({})
            end
        }

        -- render markdown
        -- render markdown file
        -- used by avante
        use {
            "MeanderingProgrammer/render-markdown.nvim",
            after = {
                "nvim-treesitter"
            },
            config = function()
                require("render-markdown").setup({})
            end
        }

        -- repeat
        -- fix something, not sure what but it is used by leap
        use {
            "tpope/vim-repeat"
        }

        -- smear cursor
        -- useless so mandatory
        use {
            "sphamba/smear-cursor.nvim",
            config = function()
                require("smear_cursor").setup({})
            end
        }

        -- telescope
        -- fuzzy finder
        use {
            "nvim-telescope/telescope.nvim",
            after = {
                "plenary.nvim",
                "nvim-web-devicons"
            },
            config = function()
                local builtin = require("telescope.builtin")

                vim.keymap.set("n", "<leader>ff", builtin.find_files)
                vim.keymap.set("n", "<leader>fg", builtin.live_grep)
                vim.keymap.set("n", "<leader>fr", builtin.lsp_references)
                vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols)
            end
        }

        -- tiny inline diagnostic
        -- better looking diagnostic messages
        use {
            "rachartier/tiny-inline-diagnostic.nvim",
            config = function()
                require("tiny-inline-diagnostic").setup()
                vim.diagnostic.config({ virtual_text = false })
            end
        }

        -- todo comments
        -- highlight todo comments
        use {
            "folke/todo-comments.nvim",
            after = {
                "plenary.nvim"
            },
            config = function()
                require("todo-comments").setup({})
            end
        }

        -- treesitter
        -- highlight code and much more
        use {
            "nvim-treesitter/nvim-treesitter",
            run = function()
                local ts_update = require("nvim-treesitter.install").update({with_sync=true})
                ts_update()
            end,
            config = function()
                require("nvim-treesitter.configs").setup({
                    highlight = {
                        enable = true
                    },
                    indent = {
                        enable = true
                    }
                })
            end,
        }

        -- ufo
        -- fold engine
        use {
            "kevinhwang91/nvim-ufo",
            after = {
                "promise-async",
                "nvim-treesitter"
            },
            config = function()
                require("ufo").setup({
                    provider_selector = function(bufnr, filetype, buftype)
                        return {"treesitter", "indent"}
                    end
                })

                vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
                vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
                vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
                vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)
            end
        }

        -- vifm
        -- vifm integration with neovim
        use {
            "vifm/vifm.vim",
            config = function()
                vim.keymap.set("n", "<leader>o", ":EditVifm<cr>")
            end
        }

        -- web devicons
        -- library used by plugins
        -- used by bufferline, lualine, telescope
        use {
            "nvim-tree/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup({
                    color_icons = true,
                    default = true,
                    strict = true
                })
            end
        }
    end
)
