return {
    -- accent
    -- accent mode to make it easier to type in french
    {
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
    },

    -- autopairs
    -- auto pair completion
    {
        "windwp/nvim-autopairs",
        opts = {
        }
    },

    -- blink cmp
    -- auto completion using lsp
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        version = "1.*",
        opts = {
            keymap = {preset = "default"},
            appearance = {
                nerd_font_variant = "mono"
            },
            completion = {documentation = {auto_show = true}},
            sources = {
                default = {"lsp", "path", "snippets", "buffer"},
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            signature = {enabled = true},
        },
    },

    -- blink indent
    -- indent guide based on indentation
    {
        "saghen/blink.indent",
        opts = {}
    },

    -- bufferline
    -- show opened files and which one to save
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {},
    },

    -- bufkill
    -- close a buffer easily
    {
        "qpkorr/vim-bufkill",
        keys = {
            {"<leader>x", "<cmd>BD<cr>", desc="close buffer"}
        }
    },

    -- catpuccin
    -- colorscheme
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                transparent_background = false,
            })

            vim.cmd.colorscheme "catppuccin-mocha"
        end
    },

    -- dap
    -- debugger
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "mfussenegger/nvim-dap-python",
            },
            {
                "rcarriga/nvim-dap-ui",
                dependencies = {
                    "nvim-neotest/nvim-nio"
                },
                keys = {
                    {"<F5>", function() require("dap").continue() end},
                },
                config = function()
                    require("dapui").setup({})

                    local dap, dapui = require("dap"), require("dapui")
                    dap.listeners.before.attach.dapui_config = function()
                        dapui.open()
                    end
                    dap.listeners.before.launch.dapui_config = function()
                        dapui.open()
                    end
                end
            }
        },
        keys = {
            {"<F5>", function() require("dap").continue() end},
            {"<F6>", function() require("dap").step_over() end},
            {"<F7>", function() require("dap").step_over() end},
            {"<F7>", function() require("dap").step_out() end},
            {"<leader>b", function() require("dap").toggle_breakpoint() end},
            {"<leader>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end},
        },
    },

    -- dap config for python
    {
        "mfussenegger/nvim-dap-python",
        keys = {
            {"<F5>", function() require("dap").continue() end, ft="python"},
        },
        config = function()
            require("dap-python").setup("/home/azureuser/Repositories/invoice-entry.tpetiteau/venv/bin/python")
        end
    },

    -- dbee
    -- database ide
    {
        "kndndrj/nvim-dbee",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        keys = {
            {"<leader>db", function() require("dbee").open() end}
        },
        build = function()
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup()
        end,
    },

    -- git blame
    {
        "f-person/git-blame.nvim",
        cmd = {
            "GitBlameToggle"
        },
        opts = {
            enabled = false
        },
    },

    -- haunt
    -- annotate code
    {
        "TheNoeTrevino/haunt.nvim",
        keys = {
            {"<leader>ha", function() require("haunt.api").annotate() end},
            {"<leader>hd", function() require("haunt.api").delete() end},
            {"<leader>hl", function() require("haunt.picker").show() end},
        },
    },

    -- illuminate
    -- hightlight current word
    {
        "RRethy/vim-illuminate"
    },

    -- leap
    -- jump around
    {
        "https://codeberg.org/andyg/leap.nvim.git",
        config = function()
            require("leap").opts.preview = function(ch0, ch1, ch2)
                return not (
                    ch1:match("%s")
                    or (ch0:match("%a") and ch1:match("%a") and ch2:match("%a"))
                )
            end

            vim.keymap.set({"n", "x", "o"}, "s", "<Plug>(leap)")
        end
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {

        },
    },

    -- mason
    -- use to install lsp servers
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    -- no neck pain
    -- avoid neck pain, it is in the title
    {
        "shortcuts/no-neck-pain.nvim",
        opts = {
            autocmds = {
                enableOnVimEnter = true,
                reloadOnColorSchemeChange = true,
            },
            buffers = {
                right = {
                    enabled = false,
                },
                biend = -.2,
                scratchPad = {
                    enabled = True,
                    location = "~/Documents"
                },
                bo = {
                    filetype = "md"
                }
            }
        }
    },

    -- ocs 52
    -- allow copy from ssh neovim
    {
        "ojroques/nvim-osc52",
        config = function()
            require("osc52").setup({
                max_length = 0,          -- Maximum length of selection (0 for no limit)
                silent = false,          -- Disable message on successful copy
                trim = false            -- Trim surrounding whitespaces before copy
            })
            local function copy()
                if ((vim.v.event.operator == "y" or vim.v.event.operator == "d")
                    and vim.v.event.regname == "") then
                        require("osc52").copy_register("")
                end
            end
            vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
        end,
    },

    -- oil
    -- file explorer
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        keys = {
            {"<leader>o", "<cmd>Oil --float<cr>"}
        },
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
    },

    -- smear cursor
    -- animate cursor
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        version = '*',
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- optional but recommended
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            },
        },
        keys = {
            {"<leader>ff", function() require("telescope.builtin").find_files() end},
            {"<leader>fg", function() require("telescope.builtin").live_grep() end},
            {"<leader>fr", function() require("telescope.builtin").lsp_references() end},
            {"<leader>fs", function() require("telescope.builtin").lsp_document_symbols() end},
        }
    },

    -- tiny glimmer
    -- animation for small things
    {
        "rachartier/tiny-glimmer.nvim",
        opts = {
            overwrite = {
                search = {
                    enabled = true
                },
                undo = {
                    enabled = true
                },
                redo = {
                    enabled = true
                },
            },
        },
    },

    -- tiny inline diagnostic
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        config = function()
            require("tiny-inline-diagnostic").setup()
            vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
        end,
    },

    -- toggle term
    -- open a terminal inside neovim
    {
        "akinsho/toggleterm.nvim",
        opts = {
            hide_numbers = false,
            insert_mappings = false,
            direction = "float",
            persist_mode = false,
            float_opts = {
                border = "curved"
            },
        },
        keys = {
            {"<leader>tt", ":ToggleTerm<cr>"},
            {"<leader>tt", [[<c-\><c-n>:ToggleTerm<cr>]], mode="t"},
            {"kj", [[<c-\><c-n>]], mode="t"},
            {"kj", [[<c-\><c-n>]], mode="t"},
        },
    },

    -- treesitter
    -- hightlight code, do magic and be amazed
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = {
                enable = true
            },
        },
        config = function()
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { "python" },
                callback = function() vim.treesitter.start() end,
            })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { "sql" },
                callback = function() vim.treesitter.start() end,
            })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { "lua" },
                callback = function() vim.treesitter.start() end,
            })
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    },

    -- ufo
    -- fold
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            {
                "kevinhwang91/promise-async"
            }
        },
        opts = {
            provider_selector = function(bufnr, filetype, buftype)
                return {"treesitter", "indent"}
            end
        },
        keys = {
            {"zR", function() require("ufo").openAllFolds() end},
            {"zM", function() require("ufo").closeAllFolds() end},
            {"zr", function() require("ufo").openFoldsExceptKinds() end},
            {"zm", function() require("ufo").closeFoldsWith() end},
        }
    },
}
