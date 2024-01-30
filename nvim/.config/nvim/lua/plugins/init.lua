return {
  'alvan/vim-closetag',
  'bronson/vim-trailing-whitespace',
  'danro/rename.vim',
  'moll/vim-bbye',
  'rubberduck203/aosp-vim',
  'tpope/vim-abolish',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'wakatime/vim-wakatime',
  'wellle/targets.vim',
  'hrsh7th/vim-vsnip',
  { 'numToStr/Comment.nvim', config = true },
  {
    'RRethy/nvim-base16',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('base16-tomorrow-night')
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<cr>"] = cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Replace,
             select = false,
          }),
          ["<tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
          ["<S-tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        },

        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
          }, {
            { name = 'buffer' },
          }),

        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = '...',
            show_labelDetails = true,
          })
        },
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          }),
      })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = 'Preview Git hunk' })

        -- Don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({'n', 'v'}, ']c',
          function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<ignore>'
          end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
        vim.keymap.set({'n', 'v'}, '[c',
          function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<ignore>'
          end, { expr = true, buffer = bufnr, desc = "Jump to Previous hunk" })
      end,
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      { 'folke/neodev.nvim', config = true },
      { 'j-hui/fidget.nvim', tag = 'legacy', config = true },
      { 'williamboman/mason.nvim', config = true },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'base16',
      },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && ' ..
          'cmake --build build --config Release && '..
          'cmake --install build --prefix build',
        cond = function()
          return vim.fn.executable 'cmake' == 1
        end,
      },
    },
    config = function()
      local select_one_or_multi = function(prompt_bufnr)
        local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
        local multi = picker:get_multi_selection()
        if not vim.tbl_isempty(multi) then
          require('telescope.actions').close(prompt_bufnr)
          for _, j in pairs(multi) do
            if j.path ~= nil then
              vim.cmd(string.format('%s %s', 'edit', j.path))
            end
          end
        else
          require('telescope.actions').select_default(prompt_bufnr)
        end
      end
      require('telescope').setup({
          defaults = {
            mappings = {
              i = {
                ['<cr>'] = select_one_or_multi,
              },
            },
          },
      })
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f/', builtin.current_buffer_fuzzy_find,
        { desc = '[F]ind lines' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files,
        { desc = '[F]ind [f]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep,
        { desc = '[F]ind with [g]rep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers,
        { desc = '[F]ind [b]uffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags,
        { desc = '[F]ind [h]elp' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics,
        { desc = '[F]ind [d]iagnostics' })
      vim.keymap.set('n', '<leader>fr', builtin.resume,
        { desc = '[F]ind [r]esume' })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        modules = {},

        ensure_installed = {
          'c',
          'cpp',
          'go',
          'lua',
          'python',
          'rust',
          'vimdoc',
          'vim',
        },

        sync_install = true,
        auto_install = true,
        ignore_install = {},
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<cr>',
            scope_incremental = '<cr>',
            node_incremental = '<tab>',
            node_decremental = '<S-tab>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end
  },
}
