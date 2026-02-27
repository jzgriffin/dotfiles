return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  -- Tree-sitter parser integration for highlighting, folding, indentation,
  -- and navigation
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
  },

  -- https://github.com/MeanderingProgrammer/treesitter-modules.nvim
  -- Reimplementation of the modules from nvim-treesitter's master branch
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ---@module "treesitter-modules"
    ---@type ts.mod.UserConfig
    opts = {
      ensure_installed = {
        "bash",
        "bp",
        "c",
        "cmake",
        "cpp",
        "csv",
        "diff",
        "ini",
        "json",
        "json5",
        "lua",
        "make",
        "markdown",
        "python",
        "rust",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      auto_install = true,

      fold = { enable = false },
      highlight = { enable = true },

      incremental_selection = {
        enable = true,
        init_selection = "<A-o>",
        scope_selection = "<A-O>",
        node_incremental = "<A-o>",
        node_decremental = "<A-i>",
      },
    },
  },

  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- Adds text objects that integrate with tree-sitter constructs
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      select = { lookahead = true },
      move = { set_jumps = true },
    },
    config = function(_, opts)
      require("nvim-treesitter-textobjects").setup(opts)

      -- Selection
      local ts_select = require("nvim-treesitter-textobjects.select")

      -- Arguments
      vim.keymap.set({ "x", "o" }, "aa",
        function()
          ts_select.select_textobject("@parameter.outer", "textobjects")
        end,
        { desc = "Select around argument" })
      vim.keymap.set({ "x", "o" }, "ia",
        function()
          ts_select.select_textobject("@parameter.inner", "textobjects")
        end,
        { desc = "Select inside argument" })

      -- Functions
      vim.keymap.set({ "x", "o" }, "af",
        function()
          ts_select.select_textobject("@function.outer", "textobjects")
        end,
        { desc = "Select around function" })
      vim.keymap.set({ "x", "o" }, "if",
        function()
          ts_select.select_textobject("@function.inner", "textobjects")
        end,
        { desc = "Select inside function" })

      -- Classes
      vim.keymap.set({ "x", "o" }, "ac",
        function()
          ts_select.select_textobject("@class.outer", "textobjects")
        end,
        { desc = "Select around class" })
      vim.keymap.set({ "x", "o" }, "ic",
        function()
          ts_select.select_textobject("@class.inner", "textobjects")
        end,
        { desc = "Select inside class" })

      -- Movement
      local ts_move = require("nvim-treesitter-textobjects.move")

      -- Arguments
      vim.keymap.set({ "n", "x", "o" }, "]a",
        function()
          ts_move.goto_next_start("@parameter.outer", "textobjects")
        end,
        { desc = "Move to start of next argument" })
      vim.keymap.set({ "n", "x", "o" }, "]A",
        function()
          ts_move.goto_next_end("@parameter.inner", "textobjects")
        end,
        { desc = "Move to end of next argument" })
      vim.keymap.set({ "n", "x", "o" }, "[a",
        function()
          ts_move.goto_previous_start("@parameter.outer", "textobjects")
        end,
        { desc = "Move to start of previous argument" })
      vim.keymap.set({ "n", "x", "o" }, "[A",
        function()
          ts_move.goto_previous_end("@parameter.inner", "textobjects")
        end,
        { desc = "Move to end of previous argument" })

      -- Functions
      vim.keymap.set({ "n", "x", "o" }, "]f",
        function()
          ts_move.goto_next_start("@function.outer", "textobjects")
        end,
        { desc = "Move to start of next function" })
      vim.keymap.set({ "n", "x", "o" }, "]F",
        function()
          ts_move.goto_next_end("@function.inner", "textobjects")
        end,
        { desc = "Move to end of next function" })
      vim.keymap.set({ "n", "x", "o" }, "[f",
        function()
          ts_move.goto_previous_start("@function.outer", "textobjects")
        end,
        { desc = "Move to start of previous function" })
      vim.keymap.set({ "n", "x", "o" }, "[F",
        function()
          ts_move.goto_previous_end("@function.inner", "textobjects")
        end,
        { desc = "Move to end of previous function" })

      -- Classes
      vim.keymap.set({ "n", "x", "o" }, "]c",
        function()
          ts_move.goto_next_start("@class.outer", "textobjects")
        end,
        { desc = "Move to start of next class" })
      vim.keymap.set({ "n", "x", "o" }, "]C",
        function()
          ts_move.goto_next_end("@class.inner", "textobjects")
        end,
        { desc = "Move to end of next class" })
      vim.keymap.set({ "n", "x", "o" }, "[c",
        function()
          ts_move.goto_previous_start("@class.outer", "textobjects")
        end,
        { desc = "Move to start of previous class" })
      vim.keymap.set({ "n", "x", "o" }, "[C",
        function()
          ts_move.goto_previous_end("@class.inner", "textobjects")
        end,
        { desc = "Move to end of previous class" })

      -- Repetition
      local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

      -- Repeat movement with ; and ,
      vim.keymap.set({ "n", "x", "o" }, ";",
        ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, ",",
        ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f",
        ts_repeat_move.builtin_f_expr,
        { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "F",
        ts_repeat_move.builtin_F_expr,
        { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "t",
        ts_repeat_move.builtin_t_expr,
        { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "T",
        ts_repeat_move.builtin_T_expr,
        { expr = true })

      -- Swapping
      local ts_swap = require("nvim-treesitter-textobjects.swap")
      vim.keymap.set("n", "<leader>a",
        function()
          ts_swap.swap_next("@parameter.inner")
        end,
        { desc = "Swap current and next arguments" })
      vim.keymap.set("n", "<leader>A",
        function()
          ts_swap.swap_next("@parameter.outer")
        end,
        { desc = "Swap current and previous arguments" })
    end,
  },
}
