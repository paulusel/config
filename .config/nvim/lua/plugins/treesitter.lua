---[[

local conf = function()
    require("nvim-treesitter.configs").setup {
        -- Add a language of your choice
        ensure_installed = { "c", "cpp", "python", "lua", "java", "rust" },
        auto_install = true, -- Auto install missing parsers
        sync_install = false,
        --ignore_install = { "" }, -- List of parsers to ignore installing
        highlight = {
            enable = true, -- false will disable the whole extension
            -- disable = { "" }, -- list of language that will be disabled

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },

        indent = {
            enable = true,
            disable = { "yaml" }
        },

        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        }
    }
end

return{
    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = conf,
}

--]q]
