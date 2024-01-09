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

                vim.cmd [[colorscheme catppuccin]]
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

        -- coq
        -- autocompletion engine
        use {
            "ms-jpq/coq_nvim",
            branch = "coq",
            after = {
                "coq.artifacts",
                "coq.thirdparty"
            },
            setup = function()
                vim.g.coq_settings = {
                    auto_start = "shut-up",
                    keymap = {
                        jump_to_mark = "<c-m>"
                    }
                }
            end
        }

        -- coq artifacts
        -- ressources used by coq
        use {
            "ms-jpq/coq.artifacts",
            branch = "artifacts"
        }

        -- coq thirparty
        -- thirparty tools used by coq
        use {
            "ms-jpq/coq.thirdparty",
            branch = "3p"
        }

        -- dap
        -- debugger protocol
        use {
            "mfussenegger/nvim-dap"
        }

        -- dap ui
        -- ui for dap
        use {
            "rcarriga/nvim-dap-ui",
            after = {
                "nvim-dap"
            },
            config = function()
                require("dapui").setup({})
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

        -- illuminate
        -- highligh current word
        use {
            "RRethy/vim-illuminate"
        }

        -- indent blankline
        -- identation guide
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("ibl").setup({})
            end
        }

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
                "coq_nvim",
                "lsp_signature.nvim",
                "mason-lspconfig.nvim"
            },
            config = function()
                local lspconfig = require("lspconfig")
                local coq = require("coq")

                lspconfig.pyright.setup(
                    coq.lsp_ensure_capabilities({
                        on_attach = function(client, bufnr)
                            require("lsp_signature").on_attach({}, bufnr)
                        end
                    })
                )

                vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration)
                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
                vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            end
        }

        -- lsp signature
        -- function signature help with lsp
        use {
            "ray-x/lsp_signature.nvim"
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
                        biend = -0.2
                    }
                })

                vim.keymap.set("n", "<leader>nn", ":NoNeckPain<cr>")
            end
        }

        -- none ls
        -- linting engine
        use {
            "nvimtools/none-ls.nvim",
            after = {
                "plenary.nvim"
            },
            config = function()
                local null_ls = require("null-ls")

                null_ls.setup({
                    sources = {
                        null_ls.builtins.diagnostics.ruff
                    }
                })
            end
        }

        -- nui
        -- library used by plugins
        -- used by dbee
        use {
            "MunifTanjim/nui.nvim"
        }

        -- packer
        -- plugin manager that manages itself
        use {
            "wbthomason/packer.nvim"
        }

        -- plenary
        -- library used by plugins
        -- used by none ls, todo comments, telescope
        use {
            "nvim-lua/plenary.nvim"
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

        -- repeat
        -- fix something, not sure what but it is used by leap
        use {
            "tpope/vim-repeat"
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
