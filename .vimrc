set encoding=utf-8 "Ставит кодировку UTF-8

au Filetype python setl et ts=4 sw=4

set tabstop=4

set number

"Плигины

"Install PlugInstall
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
"Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'scrooloose/nerdtree' 
call plug#end()

"Collor Scheme
colorscheme up 

set t_ut=""

"latex
imap <F6> <Esc>:w<CR>:!pdflatex %<CR>
nmap  <F6> <Esc>:w<CR>:!pdflatex %<CR>

"Хоткеи для петухона
imap <F5> <Esc>:w<CR>:!clear;python3 %<CR>
nmap  <F5> <Esc>:w<CR>:!clear;python3 %<CR>

cnoreabbrev python !clear;python3 %

"FileBar
nnoremap <C-n> :NERDTree<CR>

let NERDTreeQuitOnOpen=1

set timeoutlen=1000 ttimeoutlen=0 "Задержки при visual block insetr

set keymap=russian-jcukenwin
set iminsert=0 
set imsearch=0 
inoremap <C-l> <C-^>
