---[[

-- The mighty telescope

local config = {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },


    mappings = {

    },
  },

  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_ key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },

  extensions = {
    cder = {
        -- The command used to generate a list of directories.
        -- Defaults to fd on the home directory.
        -- Example for showing hidden directories:
        --   dir_command = { 'fd', '--hidden', '--type=d', '.', os.getenv('HOME') },
        -- Example for excluding certain directories:
        --   dir_command = { 'fd', '--exclude=Library', '--exclude=Pictures', '--type=d', '.', os.getenv('HOME') },  
        dir_command = {
            'fd',
            '--type=d',
            '--max-depth=4',
            '.',
            os.getenv('HOME') .. '/Projects',
            os.getenv('HOME') .. '/.config',
        },
        previewer_command = '',
    },
  },
}

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
--        lazy = true,
    dependencies = {
        {"nvim-lua/plenary.nvim"},
        --Telescope needs this one for searching
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, --optional
    },
    opts = config,
}

--]]

