-- setting the mapleader must happend before plugins are loaded to ensure the correct leader is used.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Uncomment the following line if using nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

require("artemis.options")

-- plugin manager
require("artemis.lazy_init")

require("colorizer").setup()

-- keymaps
require("artemis.keymaps")

-- LSP settings
autocmd('LspAttach', {
  callback = function(e)
    local opts = { buffer = e.buf }
    map("n", "K", function() vim.lsp.buf.hover() end, opts)
  end
})
