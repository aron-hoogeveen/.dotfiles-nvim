vim.o.hlsearch = true             -- highlight on search
vim.wo.number = true              -- linenumbers
vim.wo.relativenumber = true
vim.o.breakindent = false         -- do not add indents for lines that are too long to fit on the
                                  -- screen. Might change later
vim.o.undofile = true
vim.o.ignorecase = true           -- better search experience
vim.o.smartcase = true            -- i.d.
vim.wo.signcolumn = 'yes'         -- make it on by default. This is the small column to the left
                                  -- for e.g. a '+' when a line is added to git but not yet commited
vim.o.updatetime = 100            -- after how many milliseconds to write the swap file to disk
vim.o.timeoutlen = 300            -- you go search yourself what this does again...
vim.o.completeopt = 'menuone,noselect'  -- better completion options when hitting TAB in commands
vim.o.termguicolors = true        -- DUH!
-- TODO should we use a more specific option specifier than 'opt' below?
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = "100"
vim.opt.expandtab = true
vim.opt.mouse = ""                -- disable mouse actions (we are on laptop)
vim.opt.scrolloff = 8

