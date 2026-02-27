vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

-- Display options
vim.opt.colorcolumn = { "+1" }
vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
vim.opt.showmatch = true
vim.opt.termguicolors = true

-- Window options
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Buffer options
vim.opt.swapfile = false
vim.opt.shada = ""

-- Search options
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Editing options
vim.opt.matchpairs:append("<:>")
vim.opt.spelllang = "en_us"
vim.opt.textwidth = 80
-- formatoptions: This option is set by ftplugin.  My preferred formatoptions
-- are "tcro/qnj".  These must be set in the after/ftplugin/X.lua file for
-- each file type as necessary.

-- Indent options
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Mouse options
vim.opt.mouse = "a"

-- Command options
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.wildmode = "list:longest"
