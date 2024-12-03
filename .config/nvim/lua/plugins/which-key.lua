-- Which-Key

---@class wk.Opts
local config = {
    ---@type false | "classic" | "modern" | "helix"
    preset = "classic",
    -- Delay before showing the popup. Can be a number or a function that returns a number.
    ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
    delay = function(ctx)
        return ctx.plugin and 0 or 200
    end,
    ---@param mapping wk.Mapping
    filter = function(mapping)
        -- example to exclude mappings without a description
        -- return mapping.desc and mapping.desc ~= ""
        return true
    end,
    -- show a warning when issues were detected with your mappings
    notify = true,
    -- Which-key automatically sets up triggers for your mappings.
    -- But you can disable this and setup the triggers manually.
    -- Check the docs for more info.
    ---@type wk.Spec
    triggers = {
            { "<auto>", mode = "nxso" },
    },
    -- Start hidden and wait for a key to be pressed before showing the popup
    -- Only used by enabled xo mapping modes.
    ---@param ctx { mode: string, operator: string }
    defer = function(ctx)
        return ctx.mode == "V" or ctx.mode == "<C-V>"
    end,
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    ---@type wk.Win.opts
    win = {
        -- don't allow the popup to overlap with the cursor
        no_overlap = true,
        -- width = 1,
        -- height = { min = 4, max = 25 },
        -- col = 0,
        -- row = math.huge,
        -- border = "none",
        padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
        title = true,
        title_pos = "center",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
        -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
    },
    layout = {
        width = { min = 20 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
    },
    keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    ---@type (string|wk.Sorter)[]
    --- Mappings are sorted using configured sorters and natural sort of the keys
    --- Available sorters:
    --- * local: buffer-local mappings first
    --- * order: order of the items (Used by plugins like marks / registers)
    --- * group: groups last
    --- * alphanum: alpha-numerical first
    --- * mod: special modifier keys last
    --- * manual: the order the mappings were added
    --- * case: lower-case first
    sort = { "local", "order", "group", "alphanum", "mod" },
    ---@type number|fun(node: wk.Node):boolean?
    expand = 0, -- expand groups when <= n mappings
    -- expand = function(node)
    --   return not node.desc -- expand all nodes without a description
    -- end,
    -- Functions/Lua Patterns for formatting the labels
    ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
    replace = {
        key = {
        function(key)
            return require("which-key.view").format(key)
        end,
        -- { "<Space>", "SPC" },
        },
        desc = {
        { "<Plug>%(?(.*)%)?", "%1" },
        { "^%+", "" },
        { "<[cC]md>", "" },
        { "<[cC][rR]>", "" },
        { "<[sS]ilent>", "" },
        { "^lua%s+", "" },
        { "^call%s+", "" },
        { "^:%s*", "" },
        },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
        ellipsis = "…",
        -- set to false to disable all mapping icons,
        -- both those explicitly added in a mapping
        -- and those from rules
        mappings = true,
        --- See `lua/which-key/icons.lua` for more details
        --- Set to `false` to disable keymap icons from rules
        ---@type wk.IconRule[]|false
        rules = {},
        -- use the highlights from mini.icons
        -- When `false`, it will use `WhichKeyIcon` instead
        colors = true,
        -- used by key format
        keys = {
            Up = " ",
            Down = " ",
            Left = " ",
            Right = " ",
            C = "󰘴 ",
            M = "󰘵 ",
            D = "󰘳 ",
            S = "󰘶 ",
            CR = "󰌑 ",
            Esc = "󱊷 ",
            ScrollWheelDown = "󱕐 ",
            ScrollWheelUp = "󱕑 ",
            NL = "󰌑 ",
            BS = "󰁮",
            Space = "󱁐 ",
            Tab = "󰌒 ",
            F1 = "󱊫",
            F2 = "󱊬",
            F3 = "󱊭",
            F4 = "󱊮",
            F5 = "󱊯",
            F6 = "󱊰",
            F7 = "󱊱",
            F8 = "󱊲",
            F9 = "󱊳",
            F10 = "󱊴",
            F11 = "󱊵",
            F12 = "󱊶",
        },
    },
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    -- disable WhichKey for certain buf types and file types.
    disable = {
        ft = {},
        bt = {},
    },
    debug = false, -- enable wk.log in the current directory

    -- Mappings
    ---[==[
    spec = {
        { "<leader>l", "<cmd>bnext<cr>", desc="Next Buffer" }, -- Move to next buffer 
        { "<leader>h", "<cmd>bprevious<cr>", desc="Previous Buffer" }, -- Move to next buffer 
        { "<leader>x", "<cmd>bdelete<cr>", desc="Kill Buffer" },  -- Close current file
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc="Explorer" },
        { "<leader>p", "<cmd>Lazy<cr>", desc="Plugin Manager" }, -- Invoking plugin manager
        { "<leader>q", "<cmd>wqall!<cr>", desc="Quit" }, -- Quit Neovim after saving the file
        { "<leader>w", "<cmd>w!<cr>", desc="Save" }, -- Save current file
        { "<leader>m", "<cmd>Mason<cr>", desc="Mason UI for Lsp" },

        -- Code Runner group
        { "<leader>r", group = "Run/Build" },
        { "<leader>rr", "<cmd>RunFile<cr>", desc = "Run File" },

        -- Terminal group
        -- { "<leader>t", group = "Terminal"},
        { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Floating" },
        -- Goto group
        { "<leader>c", group = "Goto" },
        { "<leader>cd", "<cmd>Telescope cder previewer=false<cr>", desc = "Change dir" },
        -- File Search group
        { "<leader>f", group = "File Search" },
        { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
        { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
        { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text Pattern In All Files" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
        -- Search group
        { "<leader>s", group = "Search" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
        { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
        { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sd", "<cmd>Telescope cder<cr>", desc = "Directories" },
        -- LSP group
        { "<leader>z", group = "LSP" },
        { "<leader>za", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
        { "<leader>zi", "<cmd>LspInfo<cr>", desc = "Info" },
        { "<leader>zl", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
        { "<leader>zr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
        { "<leader>zs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
        { "<leader>zS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
        -- Leetcode group
        { "<leader>l", group = "Leetcode"},
        { "<leader>ld", "<cmd>Leet desc<cr>", desc = "desc"},
        { "<leader>li", "<cmd>Leet info<cr>", desc = "info"},
        { "<leader>lr", "<cmd>Leet run<cr>", desc = "run"},
        { "<leader>ls", "<cmd>Leet submit<cr>", desc = "submit"},
    },

--]==]
}

return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,

    opts = config,
}

--]]
