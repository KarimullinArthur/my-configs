set mouse=a

set encoding=utf-8 

au Filetype python setl et ts=4 sw=4
au Filetype html setl ts=2 sw=2

set tabstop=4

set number

"Плигины
"Ссылка на установку
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'scrooloose/nerdtree' 
Plug 'KabbAmine/zeavim.vim'
call plug#end()

" Цветовая схема
"
#colorscheme up 
colorscheme gruvbox
set t_ut=""

"Хоткеи для петухона
imap <F5> <Esc>:w<CR>:term python3 %<CR>
nmap <F5> <Esc>:w<CR>:term python3 %<CR>

cnoreabbrev pyt :term python3 %

"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeQuitOnOpen=1

set keymap=russian-jcukenwin
set iminsert=0 
set imsearch=0 
inoremap <C-l> <C-^>


" Docs

nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset
