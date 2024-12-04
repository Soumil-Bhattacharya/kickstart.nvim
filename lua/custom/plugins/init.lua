-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'nvim-telescope/telescope-project.nvim',
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
  },
  {
    'zk-org/zk-nvim',
    config = function()
      require('zk').setup {
        -- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
        -- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
        picker = 'telescope',

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
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn['firenvim#install'](0)
    end,
    config = function()
      vim.g.firenvim_config = {
        -- globalSettings = { alt = "all" },
        localSettings = {
          ['https://www.google.com_*.txt'] = {
            takeover = 'never',
          },
          ['.*'] = {
            selector = 'textarea',
          },
        },
      }

      vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
        callback = function(e)
          if vim.g.timer_started == true then
            return
          end
          vim.g.timer_started = true
          vim.fn.timer_start(10000, function()
            vim.g.timer_started = false
            vim.cmd 'silent write'
          end)
        end,
      })
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
