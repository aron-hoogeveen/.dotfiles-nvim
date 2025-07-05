local map = vim.keymap.set


----------------------------------------------------------------------------------------------------
--- 
--- ████████ ███████ ██      ███████ ███████  ██████  ██████  ██████  ███████ 
---    ██    ██      ██      ██      ██      ██      ██    ██ ██   ██ ██      
---    ██    █████   ██      █████   ███████ ██      ██    ██ ██████  █████   
---    ██    ██      ██      ██           ██ ██      ██    ██ ██      ██      
---    ██    ███████ ███████ ███████ ███████  ██████  ██████  ██      ███████ 
---
----------------------------------------------------------------------------------------------------
map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
map('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
map('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })


----------------------------------------------------------------------------------------------------
---
--- ██     ██ ██ ███    ██ ██████   ██████  ██     ██ ███████ 
--- ██     ██ ██ ████   ██ ██   ██ ██    ██ ██     ██ ██      
--- ██  █  ██ ██ ██ ██  ██ ██   ██ ██    ██ ██  █  ██ ███████ 
--- ██ ███ ██ ██ ██  ██ ██ ██   ██ ██    ██ ██ ███ ██      ██ 
---  ███ ███  ██ ██   ████ ██████   ██████   ███ ███  ███████ 
---
----------------------------------------------------------------------------------------------------

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })


----------------------------------------------------------------------------------------------------
---
--- ██████  ██    ██ ███████ ███████ ███████ ██████  ███████ 
--- ██   ██ ██    ██ ██      ██      ██      ██   ██ ██      
--- ██████  ██    ██ █████   █████   █████   ██████  ███████ 
--- ██   ██ ██    ██ ██      ██      ██      ██   ██      ██ 
--- ██████   ██████  ██      ██      ███████ ██   ██ ███████ 
---
----------------------------------------------------------------------------------------------------

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- new empty buffer
map({ "i", "x", "n", "s" }, "<C-n>", "<cmd>new<cr>", { desc = "Open new empty buffer" })

-- quit all
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })


----------------------------------------------------------------------------------------------------
---
--- ████████ ███████ ██████  ███    ███ ██ ███    ██  █████  ██      
---    ██    ██      ██   ██ ████  ████ ██ ████   ██ ██   ██ ██      
---    ██    █████   ██████  ██ ████ ██ ██ ██ ██  ██ ███████ ██      
---    ██    ██      ██   ██ ██  ██  ██ ██ ██  ██ ██ ██   ██ ██      
---    ██    ███████ ██   ██ ██      ██ ██ ██   ████ ██   ██ ███████ 
---
----------------------------------------------------------------------------------------------------

-- floating terminal
-- TODO make the terminal floating
map("n", "<c-/>", "<cmd>ToggleTerm<cr>", { desc = "Terminal" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })


----------------------------------------------------------------------------------------------------
--- 
--- ██    ██ ███    ██ ███████  ██████  ██████  ████████ ███████ ██████  
--- ██    ██ ████   ██ ██      ██    ██ ██   ██    ██    ██      ██   ██ 
--- ██    ██ ██ ██  ██ ███████ ██    ██ ██████     ██    █████   ██   ██ 
--- ██    ██ ██  ██ ██      ██ ██    ██ ██   ██    ██    ██      ██   ██ 
---  ██████  ██   ████ ███████  ██████  ██   ██    ██    ███████ ██████  
--- 
----------------------------------------------------------------------------------------------------

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
--
-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Nvim-Tree
map("n", "<C-e>", "<cmd>NvimTreeFocus<cr>", { desc = "Open the tree if it is closed, and then focus on the tree.", remap = true })

