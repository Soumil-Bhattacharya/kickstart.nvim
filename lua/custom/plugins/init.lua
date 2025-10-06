-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'nvim-telescope/telescope-project.nvim',
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>q',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
  },
  {
    'JASONews/glow-hover',
    config = function()
      require('glow-hover').setup {
        -- The followings are the default values
        max_width = 50,
        padding = 10,
        border = 'shadow',
        glow_path = 'glow',
      }
    end,
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        active = true,
        on_config_done = nil,
        manual_mode = false,
        detection_methods = { 'pattern' },
        patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'pom.xml' },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = 'global',
      }
    end,
  },
  {
    'zk-org/zk-nvim',
    config = function()
      require('zk').setup {
        -- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
        -- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
        picker = 'select',

        lsp = {
          -- `config` is passed to `vim.lsp.start_client(config)`
          config = {
            cmd = { 'zk', 'lsp' },
            name = 'zk',
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
          },

          -- automatically attach buffers in a zk notebook that match the given filetypes
          auto_attach = {
            enabled = true,
            filetypes = { 'markdown' },
          },
        },
      }
    end,
  },
  -- {
  --   'glacambre/firenvim',
  --
  --   -- Lazy load firenvim
  --   -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
  --   lazy = not vim.g.started_by_firenvim,
  --   build = ':call firenvim#install(0)',
  --   config = function()
  --     vim.g.firenvim_config = {
  --       globalSettings = { alt = 'all' },
  --       localSettings = {
  --         ['https://www.google.com_*.txt'] = {
  --           takeover = 'never',
  --         },
  --         -- ['.*'] = {
  --         --   selector = 'textarea',
  --         -- },
  --       },
  --     }
  --
  --     vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
  --       callback = function(e)
  --         if vim.g.timer_started == true then
  --           return
  --         end
  --         vim.g.timer_started = true
  --         vim.fn.timer_start(10000, function()
  --           vim.g.timer_started = false
  --           vim.cmd 'silent write'
  --         end)
  --       end,
  --     })
  --   end,
  -- },

  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
    },
  },

  {
    'klen/nvim-config-local',
    config = function()
      require('config-local').setup {
        -- Default options (optional)

        -- Config file patterns to load (lua supported)
        config_files = { '.nvim.lua', '.nvimrc', '.exrc' },

        -- Where the plugin keeps files data
        hashfile = vim.fn.stdpath 'data' .. '/config-local',

        autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true, -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
        silent = false, -- Disable plugin messages (Config loaded/ignored)
        lookup_parents = true, -- Lookup config files in parent directories
      }
    end,
  },
}
