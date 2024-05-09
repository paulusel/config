return {
    -- The mighty Telescope
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        lazy = true, 
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },

    -- Zen Mode Useful for focusing
    {
        "folke/zen-mode.nvim",
        lazy = true,
        opts = {
        -- configuration comes here
        }
    },

    {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    --MarkdownPreview -- Real time editing of Markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

--[[
    --nerdcommenter +++ Insane level of commenting power
    {
        "preservim/nerdcommenter",
        lazy = false,
    },
]]

    --Toggleterm - A nice terminal
    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        version = "*",
        config = true
    },

    --Which-key ** Awsome keybindings manager
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- configuration comes here
        }
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
    },

    -- Language Support
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    },

    -- Lualine
    {
    'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
    },

    --Tokyo night themes
    {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    },

    --Telescope needs this one for searching
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },

    --Code Runner
    {
        "CRAG666/code_runner.nvim",
        config = function()
            require('code_runner').setup({
                filetype = {
                    java = {
                        "cd $dir &&",
                        "javac $fileName &&",
                        "java $fileNameWithoutExt"
                    },
                    python = "python -u",
                    typescript = "deno run",
                    rust = {
                        "cd $dir &&",
                        "rustc $fileName &&",
                        "$dir/$fileNameWithoutExt"
                    },
                    c = {
                        "cd $dir &&",
                        "gcc $fileName -o $fileNameWithoutExt &&",
                        "$dir/$fileNameWithoutExt",
                        },
                    cpp = {
                        "cd $dir &&",
                        "g++ -std=c++23 $fileName -o $fileNameWithoutExt &&",
                        "$dir/$fileNameWithoutExt",
                        },
                    sh = "bash",
                },
        })
        end
    },

    -- Changing project directories
    {
        "LintaoAmons/cd-project.nvim",
        config = function()
        require("cd-project").setup({
            project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
            choice_format = "both",
            projects_picker = "telescope",
        })
        end,
    },

    -- Directory Explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        }
    },

    {
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons", -- Devicons
            --"stevearc/resession.nvim"       -- Optional, for persistent history
        },
        config = true
    },

    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },

    {
        'dense-analysis/ale',
        config = function()
            local g = vim.g

            -- g.ale_ruby_rubocop_auto_correct_all = 1

            g.ale_linters = {
                -- ruby = {'rubocop', 'ruby'},
                cpp = {'clangd'},
                lua = {'lua_language_server'}
            }
        end
    },

    {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },

    {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here
    end
    }

}
