return {

---[[
-- Language Support
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = { },
    },


    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required

    -- Mason
    {
        'williamboman/mason.nvim',
        config = function()
           require('mason').setup()
        end,
    },
    {'williamboman/mason-lspconfig.nvim'},

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

--]]
}
