--    https://github.com/folke/lazy.nvim

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Even plugins that do not require setup are placed in the "plugins" directory.
-- This is a bit verbose, but allows for tracking later config changes in the plugin.
-- Also allows for checking when I included a plugin.
require("lazy").setup({

  spec = "artemis.plugins",

})
