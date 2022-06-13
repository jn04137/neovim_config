call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'kaicataldo/material.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'

Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

colorscheme material

let g:material_terminal_italics=1

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent

set number
set relativenumber
let g:user_emmet_leader_key=','
let g:indentLine_enabled=0

map <C-n> :NERDTreeToggle<CR>
nmap <C-P> :FZF<CR>

source $HOME/.config/nvim/plug-config/coc.vim
