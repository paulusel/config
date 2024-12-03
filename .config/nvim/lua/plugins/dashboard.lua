local config = {
    theme = 'hyper',
    config = {
        week_header = {
        enable = true,
        },
        shortcut = {
            -- action can be a function type
            -- { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
        },
        packages = { enable = false }, -- show how many plugins neovim loaded
        -- limit how many projects list, action when you press key or enter it will run this action.
        -- action can be a functino type, e.g.
        -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
        project = { enable = false, limit = 8, icon = '', label = '', action = 'Telescope find_files cwd=' },
        mru = { limit = 10, icon = '', label = '', cwd_only = false },
        footer = {}, -- footer
    },
    hide = {
        statusline = true,
        tabline = true,
        winbar = true,
    },
}

return {
---[[
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
        {'nvim-tree/nvim-web-devicons'}
    },
    opts = config;
--]]
}

