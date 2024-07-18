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

local let set = vim.opt
set.shiftwidth = 2
set.tabstop = 2
-- set.expandtab = true
set.smarttab = true
set.smartindent = true
set.smarttab = true
set.wrap = false
set.number = true
set.termguicolors = true

--set.foldmethod="expr"
--set.foldexpr="nvim_treesitter#foldexpr()"

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

vim.cmd[[colorscheme tokyonight-night]]

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
    ['<C-CR>'] = cmp.mapping.confirm({select = false}),
  })
})

require('mason').setup{}

require'nvim-treesitter.configs'.setup{}
local lspconfig = require('lspconfig')
local servers = { 'gopls', 'tsserver', 'templ', 'pyright'}
lspconfig.configs.setup{}
lspconfig.emmet_language_server.setup {}
lspconfig.elixirls.setup {
  cmd = {"/Users/wthunder/elixir-ls/elixir_ls/language_server.sh"}
}
lspconfig.svelte.setup {}
lspconfig.lua_ls.setup {}
lspconfig.jdtls.setup {}
lspconfig.htmx.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"html", "templ"}
})
lspconfig.tailwindcss.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "templ", "astro", "javascript", "typescript", "react" },
  init_options = { userLanguages = { templ = "html" } },
})
lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "templ" }
})
-- lspconfig.ruby_ls.setup{}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
vim.filetype.add({ extension = { templ = "templ" }})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

--local vim = vim
--local api = vim.api
--local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
--function M.nvim_create_augroups(definitions)
--    for group_name, definition in pairs(definitions) do
--        api.nvim_command('augroup '..group_name)
--        api.nvim_command('autocmd!')
--        for _, def in ipairs(definition) do
--            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
--            api.nvim_command(command)
--        end
--        api.nvim_command('augroup END')
--    end
--end


--local autoCommands = {
--    -- other autocommands
--    open_folds = {
--        {"BufReadPost,FileReadPost", "*", "normal zR"}
--    }
--}
--
--M.nvim_create_augroups(autoCommands)
