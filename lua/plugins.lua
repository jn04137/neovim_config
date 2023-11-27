return {
  {
    'nvim-telescope/telescope.nvim', tag='0.1.2',
    dependencies= {'nvim-lua/plenary.nvim'}
  }, {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    event = 'VeryLazy',
    config = function()
      -- Load treesitter grammar for org
      require('orgmode').setup_ts_grammar()

      -- Setup treesitter
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'org' },
        },
        ensure_installed = { 'org' },
      })

      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      })
    end,
  }, {
    "folke/tokyonight.nvim",
    lazy=false,
    priority=1000,
    opts={}
  }, {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy=false
  }, {
    'neovim/nvim-lspconfig'
  }, {
    'nvim-tree/nvim-tree.lua'
  }, {
    'nvim-treesitter/nvim-treesitter'
  }, {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  }, {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true
  }, {
    "ellisonleao/gruvbox.nvim", priority=1000, config=true
  }, {
    "marko-cerovac/material.nvim"
  },
  {"VonHeikemen/lsp-zero.nvim", branch="v3.x"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"},
  {"L3MON4D3/LuaSnip"},
  {"hrsh7th/cmp-nvim-lsp-signature-help"}
}
