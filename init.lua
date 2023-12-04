local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Disables netrw, i.e. Exp, Hex
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

local let set = vim.opt
set.shiftwidth = 2
set.tabstop = 2
set.expandtab = true
set.softtabstop = 2
set.smarttab = true
set.autoindent = true
set.wrap = false
set.number = true
set.termguicolors = true

require("lazy").setup('plugins')
require("lualine").setup({
  options = { fmt = string.lower },
  sections = { lualine_a = {
    {
      'datetime',
      style = '%H:%M'
    }
  }}
})

--require('nvim-tree').setup {}
--vim.keymap.set('n', '<C-N>', ':NvimTreeToggle<CR>', {noremap=true, silent=true})

require('nvim-treesitter.configs').setup {
    ensure_installed = {"lua", "vim", "javascript", "go", "svelte", "sql"}, -- install parsers for all supported languages
    --sync_install = false,
    --ignore_install = { },
    highlight = {
      enable = true,
      disable = { },
    },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-P>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<C-N>', ":Exp<CR>", {noremap=true, silent=true})

vim.g.material_style = "darker"
vim.cmd[[colorscheme gruvbox]]

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr) 
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp_signature_help'},
    { name = 'nvim_lsp'}
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  })
})

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.emmet_language_server.setup {}
lspconfig.elixirls.setup {
  cmd = {"/Users/wthunder/elixir-ls/elixir_ls/language_server.sh"}
}
lspconfig.svelte.setup {}
lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {}
lspconfig.jdtls.setup {}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
