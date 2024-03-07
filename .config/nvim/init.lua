--Init file for lua
--Just used for sourcing other files
vim.g.mapleader = ' '

require "lazy-config"
vim.cmd[[ colorscheme tokyonight-night ]]

require "options"
-- require "nvim-tree-config"
require "autopairs-config"
--require "keymaps"
--require "alpha-config"
-- require "bufferline-config"
require "lualine-config"
require "lsp-config"
require "telescope-config"
require "toggleterm-config"
require "treesitter-config"
require "whichkey-config"

require('lualine').setup()
--require("nvim-tree").setup()
require("mason").setup()
