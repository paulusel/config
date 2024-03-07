return {
    -- The mighty Telescope
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        lazy = true, 
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },

--[[
    -- Quickly Changing working directory with telescope
    {
        "zane-/cder.nvim",
    },
]]

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

--[[    -- Nvimtree (File Explorer)
    {
    'nvim-tree/nvim-tree.lua',
        dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    },
]]

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

--[[    -- Bufferline
    {
    'akinsho/bufferline.nvim',
        dependencies = {
        'nvim-tree/nvim-web-devicons'
        },
    },
]]

--[[
    -- Table line at top - barbar
    {
        'romgrk/barbar.nvim',
        dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
        -- animation = true,
        -- insert_at_start = true,
            sidebar_filetypes = {
                ['neo-tree'] = {event = 'BufWipeout'},
            },
        },
        version = '^1.7.0', -- optional: only update when a new 1.x version is released
    },
]]

    --Telescope needs this one for searching
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },

--[[
    {
        'goolord/alpha-nvim',
        lazy = true,
        dependencies = {
        'nvim-tree/nvim-web-devicons'
        },
    },

    {
        'tpope/vim-fugitive'
    },
]]

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
                    python = "python3 -u",
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
                        "g++ -std=c++20 $fileName -o $fileNameWithoutExt &&",
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

}
