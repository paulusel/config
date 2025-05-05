--Init file for Nvim. Just used for sourcing other files

--Nvim options. This has to be loaded FIRST.
require('config.options')

require('config.lazy') -- lazy plugin manager
require('config.language-servers') -- lsps
