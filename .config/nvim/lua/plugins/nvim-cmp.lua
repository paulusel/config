local nvim_cmp_opts = function(_, opts)
    local cmp = require'cmp'
    opts.sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'path'},
        {name = 'buffer'},
    }
    opts.mapping = cmp.mapping.preset.insert({
        ['<tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
    })
    opts.snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end
    }
end

return {
    'hrsh7th/nvim-cmp',
    opts = nvim_cmp_opts,
    dependencies = {
        { 'luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
    }
}
