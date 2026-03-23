return {
  -- https://github.com/folke/snacks.nvim
  -- Collection of small quality of life plugins for Neovim
  {
    "folke/snacks.nvim",
    dependencies = {
      "nvim-mini/mini.icons",
      "nvim-tree/nvim-web-devicons",
    },
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
      explorer = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      -- Top Pickers & Explorer
      { "<Leader><Space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<Leader>,",  function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<Leader>/",  function() Snacks.picker.grep() end, desc = "Grep" },
      { "<Leader>:",  function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<Leader>fn", function() Snacks.picker.notifications() end, desc = "Notification History" },
      { "<Leader>e",  function() Snacks.explorer() end, desc = "File Explorer" },
      -- find
      { "<Leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<Leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<Leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<Leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<Leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
      { "<Leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
      -- git
      { "<Leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<Leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<Leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<Leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<Leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<Leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<Leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      -- gh
      { "<Leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
      { "<Leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
      { "<Leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
      { "<Leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
      -- Grep
      { "<Leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<Leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<Leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<Leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      -- search
      { '<Leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { '<Leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<Leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<Leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<Leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<Leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<Leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<Leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<Leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<Leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<Leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
      { "<Leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<Leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<Leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<Leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<Leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      { "<Leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<Leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<Leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
      { "<Leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
      { "<Leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
      { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
      { "<Leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<Leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      -- Other
      { "<Leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<Leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      { "<Leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<Leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<Leader>d",  function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<Leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
      { "<Leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
      { "<Leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<Leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<C-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<C-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end

          -- Override print to use snacks for `:=` command
          if vim.fn.has("nvim-0.11") == 1 then
            vim._print = function(_, ...)
              dd(...)
            end
          else
            vim.print = _G.dd
          end

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<Leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<Leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<Leader>uL")
          Snacks.toggle.diagnostics():map("<Leader>ud")
          Snacks.toggle.line_number():map("<Leader>ul")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<Leader>uc")
          Snacks.toggle.treesitter():map("<Leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<Leader>ub")
          Snacks.toggle.inlay_hints():map("<Leader>uh")
          Snacks.toggle.indent():map("<Leader>ug")
          Snacks.toggle.dim():map("<Leader>uD")
        end,
      })
    end,
  },
}
