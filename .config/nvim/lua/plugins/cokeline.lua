---[[
local cokeline_opts= {
  show_if_buffers_are_at_least = 2,

  buffers = {
    focus_on_delete = 'prev',
    new_buffers_position = 'last',
    delete_on_right_click = false,
  },

  mappings = {
    cycle_prev_next = true,
    disable_mouse = true,
  },

  history = {
    enabled = false,
  },

  default_hl = {
    fg = function(buffer)
      local hlgroups = require("cokeline.hlgroups")
      return buffer.is_focused and '#F26F39' or hlgroups.get_hl_attr("Normal", "fg")
    end,

    bg = function(buffer)
      local hlgroups = require("cokeline.hlgroups")
      return buffer.is_focused and "#2c2f3f" or hlgroups.get_hl_attr("ColorColumn", "bg")
    end,
  },

  --@type Component[] | false
  --components = {},
    components = {
        {
            text = function(buffer)
                return " " .. buffer.devicon.icon
            end,
            fg = function(buffer)
                return buffer.devicon.color
            end,
        },
        {
            text = function(buffer)
                return buffer.unique_prefix
            end,
            fg = function()
                local hlgroups = require("cokeline.hlgroups")
                return hlgroups.get_hl_attr("Comment", "fg")
            end,
            italic = true,
        },
        {
            text = function(buffer)
                return buffer.filename
            end,
        },
        {
            text = " ",
        },
        {
            text = function(buffer)
                if buffer.is_modified then return "" end
                return ""
            end,
            fg = function(buffer)
                return buffer.devicon.color
            end,
        },
        {
            text = " ",
        },
  },
}

return {
    "willothy/nvim-cokeline",
    dependencies = {
        "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
        "nvim-tree/nvim-web-devicons", -- Devicons
    },
    opts = cokeline_opts,
}

--]]
