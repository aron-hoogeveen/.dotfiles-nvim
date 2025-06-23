-- setting the mapleader must happend before plugins are loaded to ensure the correct leader is used.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("artemis.options")

-- plugin manager
require("artemis.lazy_init")

require("artemis.keymaps")
