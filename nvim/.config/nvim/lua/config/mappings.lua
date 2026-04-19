-- Convenience mappings
vim.keymap.set({ "n", "x" }, "<Space>", "<NOP>",
	{ desc = "Prevent space from moving forward", silent = true })
vim.keymap.set("v", ".", ":normal .<CR>",
  { desc = "Repeat last change on visual selection" })
vim.keymap.set("n", "<CR>", ":", { desc = "Enter command mode" })

-- Tab mappings
vim.keymap.set("", "<S-h>", "gT", { desc = "Go to the previous tab page" })
vim.keymap.set("", "<S-l>", "gt", { desc = "Go to the next tab page" })

-- Window mappings
vim.keymap.set("", "<C-h>", "<C-w>h",
	{ desc = "Go to the window to the left" })
vim.keymap.set("", "<C-j>", "<C-w>j",
  { desc = "Go to the window below" })
vim.keymap.set("", "<C-k>", "<C-w>k",
  { desc = "Go to the window above" })
vim.keymap.set("", "<C-l>", "<C-w>l",
	{ desc = "Go to the window to the right" })

vim.keymap.set("n", "<Leader>n", "<CMD>enew<CR>",
	{ desc = "Create a new buffer" })
vim.keymap.set("n", "<Leader>%", "<CMD>vnew<CR>",
	{ desc = "Create a new buffer in a new vertical window split" })
vim.keymap.set("n", '<Leader>"', "<CMD>new<CR>",
	{ desc = "Create a new buffer in a new horizontal window split" })

-- Buffer mappings
vim.keymap.set("n", "<BS>", "<C-^>",
	{ desc = "Jump to the most recent buffer" })
vim.keymap.set("n", "<Leader>[", "<CMD>bprevious<CR>",
	{ desc = "Jump to the previous buffer" })
vim.keymap.set("n", "<Leader>]", "<CMD>bnext<CR>",
	{ desc = "Jump to the next buffer" })
vim.keymap.set("n", "<Leader>w", "<CMD>write<CR>",
	{ desc = "Write the buffer" })
vim.keymap.set("n", "<Leader>W", "<CMD>write<CR>",
	{ desc = "Write all buffers" })

-- Movement mappings
vim.keymap.set("n", "<Down>", "gj", { desc = "Go down one visual line" })
vim.keymap.set("n", "<Up>", "gk", { desc = "Go up one visual line" })

-- Editing mappings
vim.keymap.set("n", "<Esc><Esc>", "<CMD>nohlsearch<CR>",
	{ desc = "Stop highlighting the search results", silent = true })

vim.keymap.set({"n", "x"}, "x", '"_x',
	{ desc = "Delete without changing registers" })

vim.keymap.set({"n", "x"}, "cy", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set({"n", "x"}, "cp", '"+p', { desc = "Paste from clipboard" })

vim.keymap.set("x", "<M-h>", "<gv", { desc = "Shift selection left" })
vim.keymap.set("x", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Shift selection down" })
vim.keymap.set("x", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Shift selection up" })
vim.keymap.set("x", "<M-l>", ">gv", { desc = "Shift selection right" })
vim.keymap.set("x", "<", "<gv", { desc = "Shift selection left" })
vim.keymap.set("x", ">", ">gv", { desc = "Shift selection right" })

vim.keymap.set("n", "Y", "y$", { desc = "Yank to the end of the line" })

-- Diagnostic mappings
vim.keymap.set("n", "[d",
  function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d",
  function() vim.diagnostic.jump({ count = 1, float = true }) end,
  { desc = "Go to next diagnostic message" })

-- List navigation mappings

-- <C-j>/<C-k> navigation between omnifunc items
vim.keymap.set("i", "<C-j>",
function() return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>" end,
  { desc = "Next completion item", expr = true })
vim.keymap.set("i", "<C-k>",
function() return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>" end,
  { desc = "Previous completion item", expr = true })

-- <C-j>/<C-k> navigation between quickfix items
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "<C-j>", "<cmd>cnext<cr>", opts)
    vim.keymap.set("n", "<C-k>", "<cmd>cprev<cr>", opts)
  end,
})
