return {
  -- https://github.com/tpope/vim-fugitive
  -- Adds Git commands
  --
  -- Usage:
  --   :G            Summarizes the Git status
  --   :G {command}  Runs a Git command
  "tpope/vim-fugitive",

  -- https://github.com/lewis6991/gitsigns.nvim
  -- Adds gutter signs for the status of lines according to Git
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Navigation
        map("n", "]c",
          function()
            if vim.wo.diff then
              vim.cmd.normal({"]c", bang = true})
            else
              gitsigns.nav_hunk("next")
            end
          end,
          { desc = "Jump to next hunk" })
        map("n", "[c",
          function()
            if vim.wo.diff then
              vim.cmd.normal({"[c", bang = true})
            else
              gitsigns.nav_hunk("prev")
            end
          end,
          { desc = "Jump to previous hunk" })

        -- Actions
        map("n", "<Leader>hs", gitsigns.stage_hunk,
          { desc = "Stage current hunk" })
        map("n", "<Leader>hr", gitsigns.reset_hunk,
          { desc = "Reset current hunk" })

        map("v", "<Leader>hs",
          function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          { desc = "Stage selected lines" })
        map("v", "<Leader>hr",
          function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          { desc = "Unstage selected lines" })

        map("n", "<Leader>hS", gitsigns.stage_buffer,
          { desc = "Stage current buffer" })
        map("n", "<Leader>hR", gitsigns.reset_buffer,
          { desc = "Reset current buffer" })
        map("n", "<Leader>hp", gitsigns.preview_hunk,
          { desc = "Preview current hunk" })
        map("n", "<Leader>hi", gitsigns.preview_hunk_inline,
          { desc = "Preview current hunk (inline)" })

        map("n", "<Leader>hb",
          function() gitsigns.blame_line({ full = true }) end,
          { desc = "Show blame for current line" })

        map("n", "<Leader>hd", gitsigns.diffthis,
          { desc = "Diff the current buffer against the index" })
        map("n", "<Leader>hD",
          function() gitsigns.diffthis("~") end,
          { desc = "Diff the current buffer against the last commit" })

        map("n", "<Leader>hQ", function() gitsigns.setqflist("all") end,
          { desc = "Show all hunks in quickfix list" })
        map("n", "<Leader>hq", gitsigns.setqflist,
          { desc = "Show current buffer hunks in quickfix list" })

        -- Toggles
        map("n", "<Leader>tb", gitsigns.toggle_current_line_blame,
          { desc = "Toggle inline blame annotation on the current line" })
        map("n", "<Leader>tw", gitsigns.toggle_word_diff,
          { desc = "Toggle intra-line word difference highlighting" })

        -- Text object
        map({"o", "x"}, "ih", gitsigns.select_hunk,
          { desc = "Select current hunk" })
      end,
    },
  },
}
