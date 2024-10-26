return {
	{
		"williamboman/mason.nvim",
	},
  {
    'nvim-telescope/telescope.nvim', tag='0.1.2',
    dependencies= {'nvim-lua/plenary.nvim'}
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
    'neovim/nvim-lspconfig',
  }, {
    'nvim-treesitter/nvim-treesitter',
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
  {"mfussenegger/nvim-jdtls"},
  {"VonHeikemen/lsp-zero.nvim", branch="v3.x"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"},
  {"L3MON4D3/LuaSnip"},
  {"hrsh7th/cmp-nvim-lsp-signature-help"},
  {"yuezk/vim-js"},
  {"maxmellon/vim-jsx-pretty"},
  {"altercation/vim-colors-solarized"},
	{"joerdav/templ.vim"},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	opts = function(_, opts)
		opts.ignore_install = { 'help' }
		if type(opts.ensure_installed) == 'table' then
      vim.list_extend(opts.ensure_installed, {
        'dockerfile',
        'git_config',
        'jsdoc',
        'make',
        'toml',
        'vimdoc',
      })
		end
	end,
  -- {"sheerun/vim-polyglot"}
}
