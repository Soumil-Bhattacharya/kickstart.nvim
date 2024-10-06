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
}
