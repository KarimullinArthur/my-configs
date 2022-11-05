set mouse=a
set encoding=utf-8 
set number
set fileformat=unix

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

au Filetype python setl et ts=4 sw=4
au Filetype html setl ts=2 sw=2

nnoremap ,<space> :nohlsearch<CR>
autocmd FileType python set colorcolumn=79

" Плигины
" Ссылка на установку
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

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

Plug 'scrooloose/nerdtree' 

Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
call plug#end()

" Цветовая схема

"colorscheme up 
colorscheme gruvbox

" Хоткеи для петухона
imap <F5> <Esc>:w<CR>:term python3 %<CR>
nmap <F5> <Esc>:w<CR>:term python3 %<CR>

cnoreabbrev pyt :term python3 %

"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeQuitOnOpen=1

" йцукен
set keymap=russian-jcukenwin
inoremap <C-l> <C-^>


"nmap <F9> <Esc>:source ~/.config/nvim/cmp.vim<CR>


" CMP & LSP
" Ctrl + Space for activate cmp
source ~/.config/nvim/cmp.vim

" LSP
"source ~/.config/nvim/lsp.vim
