return {
    {
            -- The mighty Telescope
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        lazy = true, 
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },

    {
        "zane-/cder.nvim",
    },

    --[[
    [{ -- This plugin
    [  "Zeioth/compiler.nvim",
    [  lazy = true,
    [  cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
    [  dependencies = { "stevearc/overseer.nvim" },
    [  opts = {},
    [},
    ]]

    --[[
    [{ -- The task runner we use
    [  "stevearc/overseer.nvim",
    [  lazy = true,
    [  commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
    [  cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    [  opts = {
    [    task_list = {
    [      direction = "bottom",
    [      min_height = 25,
    [      max_height = 25,
    [      default_detail = 1
    [    },
    [  },
    [},	 
    [
    ]]
        -- Zen Mode ==== Useful for focusing
    {
    "folke/zen-mode.nvim",
    lazy = true,
    opts = {
        -- your configuration comes here
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

    --nerdcommenter +++ Insane level of commenting power
    {
        "preservim/nerdcommenter",
        lazy = false,
    },

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
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    }
    },

    {
    "nvim-treesitter/nvim-treesitter",
    },

    -- Nvimtree (File Explorer)
    {
    'nvim-tree/nvim-tree.lua',
        dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
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

    -- Bufferline
    {
    'akinsho/bufferline.nvim',
        dependencies = {
        'nvim-tree/nvim-web-devicons'
        },
    },

    --Telescope needs this one for searching
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },

    -- Buffer Bar at the top
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

}

