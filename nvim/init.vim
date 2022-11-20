set mouse=a
set encoding=utf-8 
set number
set fileformat=unix
set noswapfile

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

set iskeyword-=_

au Filetype python setl et ts=4 sw=4
au Filetype html setl ts=2 sw=2

nnoremap ,<space> :nohlsearch<CR>
autocmd FileType python set colorcolumn=79

" Хоткеи для петухона
imap <F5> <Esc>:w<CR>:term python3 %<CR>
nmap <F5> <Esc>:w<CR>:term python3 %<CR>

cnoreabbrev pyt :term python3 %


" йцукен
set keymap=russian-jcukenwin
inoremap <C-l> <C-^>
set iminsert=0 " Set defualt qwerty


" tabs
nnoremap <silent> tn <Cmd>:tabnext<CR>
nnoremap <silent> tp <Cmd>:tabprevious <CR>

set guifont=AgaveMono\ Nerd\ Font\ 11

" Плигины
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim')) "Если vim-plug не стоит
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs "Создать директорию
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  "И скачать его оттуда
  "А после прогнать команду PlugInstall, о которой мы сейчас поговорим
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'Pocco81/auto-save.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'scrooloose/nerdtree' 
"Plug 'nvim-tree/nvim-tree.lua'

"Plug 'flazz/vim-colorschemes'
"Plug 'glepnir/dashboard-nvim'
"Plug 'mhinz/vim-startify'
Plug 'echasnovski/mini.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'morhetz/gruvbox'
"Plug 'xolox/vim-colorscheme-switcher'
call plug#end()

" Цветовая схема

"colorscheme up 

let g:gruvbox_italic = 1
colorscheme gruvbox


" Find files using Telescope command-line sugar.
nnoremap ,ff <cmd>Telescope find_files<cr>
nnoremap ,fg <cmd>Telescope live_grep<cr>
nnoremap ,fb <cmd>Telescope buffers<cr>
nnoremap ,fh <cmd>Telescope help_tags<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeQuitOnOpen=1


" Main init in lua
source ~/.config/nvim/main.lua

" CMP & LSP
" Ctrl + Space for activate cmp
source ~/.config/nvim/cmp.lua
set completeopt=menu,menuone,noselect

" LSP
source ~/.config/nvim/lsp.lua

" Telescope
source ~/.config/nvim/telescope.lua

" Auto save
source ~/.config/nvim/auto-save.lua

" Treesitter
source ~/.config/nvim/treesitter.lua
