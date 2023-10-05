-- Set mapleader first so that it is effective for every mapping
vim.g.mapleader = ' '
vim.g.localleader = '\\'

------------------------------------------------------------------------------
-- Plugins

local lazypath = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins')

-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Configure LSP
local lsp_on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: '..desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local lsp_servers = {
  clangd = {},
  cmake = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(lsp_capabilities)

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(lsp_servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = lsp_capabilities,
      on_attach = lsp_on_attach,
      settings = lsp_servers[server_name],
      filetypes = (lsp_servers[server_name] or {}).filetypes,
    }
  end
}

------------------------------------------------------------------------------
-- Options

vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

---------------------------------------
-- Display options
vim.opt.colorcolumn = { '+1' }
vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
vim.opt.showmatch = true
vim.opt.termguicolors = true

---------------------------------------
-- Window options
vim.opt.splitbelow = true
vim.opt.splitright = true

---------------------------------------
-- Buffer options
vim.opt.swapfile = false
vim.opt.shada = ''

---------------------------------------
-- Search options
vim.opt.ignorecase = true
vim.opt.smartcase = true

---------------------------------------
-- Editing options
vim.opt.matchpairs:append('<:>')
vim.opt.spelllang = 'en_us'
vim.opt.textwidth = 78
-- formatoptions: This option is set by ftplugin.  My preferred formatoptions
-- are 'tcro/qnj'.  These must be set in the after/ftplugin/X.lua file for
-- each file type as necessary.

---------------------------------------
-- Indent options
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

---------------------------------------
-- Mouse options
vim.opt.mouse = 'a'

---------------------------------------
-- Command options
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.wildmode = 'list:longest'

------------------------------------------------------------------------------
-- Mappings

---------------------------------------
-- Convenience mappings
vim.keymap.set('n', '<cr>', '<cmd>', { desc = 'Enter command mode' })
vim.keymap.set('n', '<leader>!', '<cmd>source $MYVIMRC<cr>',
	{ desc = 'Reload the configuration' })
vim.keymap.set({ 'n', 'x' }, '<space>', '<nop>',
	{ desc = 'Prevent space from moving forward', silent = true })
vim.keymap.set('x', '.', '<cmd>normal .<cr>',
	{ desc = 'Repeat the action for each line in the selection' })

---------------------------------------
-- Tab mappings
vim.keymap.set('', '<S-h>', 'gT', { desc = 'Go to the previous tab page' })
vim.keymap.set('', '<S-l>', 'gt', { desc = 'Go to the next tab page' })

---------------------------------------
-- Window mappings
vim.keymap.set('', '<C-h>', '<C-w>h',
	{ desc = 'Go to the window to the left' })
vim.keymap.set('', '<C-j>', '<C-w>j', { desc = 'Go to the window below' })
vim.keymap.set('', '<C-k>', '<C-w>k', { desc = 'Go to the window above' })
vim.keymap.set('', '<C-l>', '<C-w>l',
	{ desc = 'Go to the window to the right' })
vim.keymap.set('n', '<leader>n', '<cmd>enew<cr>',
	{ desc = 'Create a new buffer' })
vim.keymap.set('n', '<leader>%', '<cmd>vnew<cr>',
	{ desc = 'Create a new buffer in a new vertical window split' })
vim.keymap.set('n', '<leader>"', '<cmd>new<cr>',
	{ desc = 'Create a new buffer in a new horizontal window split' })

---------------------------------------
-- Buffer mappings
vim.keymap.set('n', '<bs>', '<C-^>',
	{ desc = 'Jump to the most recent buffer' })
vim.keymap.set('n', '<leader>[', '<cmd>bprevious<cr>',
	{ desc = 'Jump to the previous buffer' })
vim.keymap.set('n', '<leader>[', '<cmd>bnext<cr>',
	{ desc = 'Jump to the next buffer' })
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>',
	{ desc = 'Write the buffer' })
vim.keymap.set('n', '<leader>W', '<cmd>bufdo <cmd>write<cr>',
	{ desc = 'Write all buffers' })
vim.keymap.set('n', '<leader>d', '<cmd>Bdelete<cr>',
	{ desc = 'Close the buffer' })
vim.keymap.set('n', '<leader>D', '<cmd>bufdo <cmd>Bdelete<cr>',
	{ desc = 'Close all buffers' })

---------------------------------------
-- Movement mappings
vim.keymap.set('n', '<down>', 'gj', { desc = 'Go down one visual line' })
vim.keymap.set('n', '<up>', 'gk', { desc = 'Go up one visual line' })

---------------------------------------
-- Editing mappings
vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<cr>',
	{ desc = 'Stop highlighting the search results', silent = true })
vim.keymap.set({'n', 'x'}, 'x', '"_x',
	{ desc = 'Delete without changing registers' })
vim.keymap.set({'n', 'x'}, 'cy', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({'n', 'x'}, 'cp', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('x', '<', '<gv', { desc = 'Shift selection left' })
vim.keymap.set('x', '>', '>gv', { desc = 'Shift selection right' })
vim.keymap.set('x', '<leader>s', '<cmd>sort<cr>',
	{ desc = 'Sort the selection' })
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to the end of the line' })

---------------------------------------
-- Diagnostic mappings
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
    { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
    { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,
    { desc = 'Open floating diagnostic message' })

------------------------------------------------------------------------------
-- User settings
pcall(require, 'user.init')
