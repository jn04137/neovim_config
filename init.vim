call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'

Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'dracula/vim'
Plug 'ntk148v/vim-horizon'
Plug 'arcticicestudio/nord-vim'
Plug 'mrjones2014/lighthaus.nvim'

Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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
endif

colorscheme	lighthaus
let g:airline_theme='lighthaus'
let g:airline_powerline_fonts=1

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set number
set relativenumber
let g:user_emmet_leader_key=','

map <C-n> :NERDTreeToggle<CR>
