-- telescope-config.lua

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end


local actions = require("telescope.actions")

-- load extensions
require("telescope").load_extension('cder')

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },


    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    }
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
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        -- -- The title of the prompt.
        cder = {
            prompt_title = function()
                return 'cwd: ' .. vim.fn.getcwd()
            end,

            -- The command used to generate a list of directories.
            -- Defaults to fd on the home directory.
            -- Example for showing hidden directories:
            --   dir_command = { 'fd', '--hidden', '--type=d', '.', os.getenv('HOME') },
            -- Example for excluding certain directories:
            --   dir_command = { 'fd', '--exclude=Library', '--exclude=Pictures', '--type=d', '.', os.getenv('HOME') },  
            dir_command = { 'fd', '--type=d', os.getenv('HOME') .. '/Projects/' },

            -- The binary used to execute previewer_command | pager_command.
            -- This is needed because termopen in Neovim does not support piping
            -- multiple commands, so we get around this by just using bash -c.
            command_executer = { 'bash', '-c' },

            -- The command used to preview directories. Defaults to ls.
            -- Example:
            --   previewer_command = 'exa -a --icons'
            previewer_command = 'ls -a',

            -- A function to return an entry given an entry produced 
            -- by dir_command. Returns the entry directly by default.
            entry_value_fn = function(entry_value)
            return '"' .. entry_value .. '"'
            end,

            -- The command used to page directory previews. Defaults to bat.
            -- Receives the output of the previewer_command as input.
            -- Example without bat:
            --   pager_command = 'less -RS'
            pager_command = 'bat --plain --paging=always --pager="less -RS"',

            -- Function to create an entry in the picker given
            -- a line outputted from the dir_command.
            --   value is used as the directory in the :cd command
            --   display is what is actually displayed, so this can
            --     be a function that trims a path prefix for example.
            entry_maker = function(line)
            return {
                value = line,
                display = function(entry)
                return ' ' .. line:gsub(os.getenv('HOME') .. '/', ''), { { { 1, 3 }, 'Directory' } }
                end,
                ordinal = line,
            }
            end,

            -- A mapping should be a function that takes as parameter the selected
            -- directory as a string.
            mappings = {
            default = function(directory)
                vim.cmd.cd(directory)
            end,
            ['<C-t>'] = function(directory)
                vim.cmd.tcd(directory)
            end,
            },
        }
    }
}

