local config = {
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
        },
        shortcut = {},
        packages = { enable = false },
        project = {
            enable = true,
            limit = 20,
            icon = '',
            label = '',
            action = function (path)
                local ok, _ = pcall(vim.cmd.cd, path)
                if(ok) then
                    vim.cmd('Neotree')
                end
            end
        },

        mru = {
            limit = 5,
            icon = '',
            label = '',
            cwd_only = false
        },
    },
    hide = {
        statusline = true,
        tabline = true,
        winbar = true,
    }
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

