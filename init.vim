set encoding=utf-8 "Ставит кодировку UTF-8

au Filetype python setl et ts=4 sw=4

set tabstop=4

set number

"Плигины
"Ссылка на установку
"h -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'scrooloose/nerdtree' 
call plug#end()

"Цветовая схема
colorscheme up 

set t_ut=""

"Хоткеи для петухона
imap <F5> <Esc>:w<CR>:term python3 %<CR>
nmap  <F5> <Esc>:w<CR>:term python3 %<CR>

cnoreabbrev python !clear;python3 %

"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeQuitOnOpen=1

set timeoutlen=1000 ttimeoutlen=0 "Задержки при visual block insetr

set keymap=russian-jcukenwin
set iminsert=0 
set imsearch=0 
inoremap <C-l> <C-^>
