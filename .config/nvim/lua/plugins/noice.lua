-- lazy.nvim
local config = {
    lsp = {
        progress = {
            enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    notify = {
        enabled = true,
        view = "mini",
    },
    messages = {
        enabled = true, -- enables the Noice messages UI
        view = "mini", -- default view for messages
        view_error = "mini", -- view for errors
        view_warn = "mini", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    cmdline = {
        enabled = true,
        view = "cmdline",
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    views = {
        mini = {
            timeout = 3000,
        },
        cmdline = {
            position = {
                row = -1,
                col = 0,
            },
        },
        cmdline_popupmenu = {
            relative = "editor",
            zindex = 65,
            position = {
                row = -3,
                col = 0,
            },
            size = {
                width = "auto",
                height = "auto",
                max_height = 10,
                -- min_width = 10,
            },
            win_options = {
                winbar = "",
                foldenable = false,
                cursorline = true,
                cursorlineopt = "line",
                winhighlight = {
                    Normal = "NoicePopupmenu", -- change to NormalFloat to make it look like other floats
                    FloatBorder = "NoicePopupmenuBorder", -- border highlight
                    CursorLine = "NoicePopupmenuSelected", -- used for highlighting the selected item
                    PmenuMatch = "NoicePopupmenuMatch", -- used to highlight the part of the item that matches the input
                },
            },
        },
    },
}

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = config,
  main = "noice",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
    }
}
