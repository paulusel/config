--Init file for Nvim
--Just used for sourcing other files

--Nvim options. This has to be loaded FIRST.
require("options")

--Lazy - Plugin manager. Must be loaded SECOND
require("config.lazy")
require('config.lsp')

vim.cmd[[ colorscheme tokyonight-night ]]
