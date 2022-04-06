set encoding=utf-8 "Ставит кодировку UTF-8

au Filetype python setl et ts=4 sw=4

set tabstop=4

set number

"Плигины
call plug#begin('~/.vim/plugged')
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'scrooloose/nerdtree' 
call plug#end()

"Хоткеи для петухона
imap <F5> <Esc>:w<CR>:!clear;python3 %<CR>
nmap  <F5> <Esc>:w<CR>:!clear;python3 %<CR>

cnoreabbrev python !clear;python3 %

"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeQuitOnOpen=1

colorscheme sublimemonokai "Цветовая схема

set timeoutlen=1000 ttimeoutlen=0 "Задержки при visual block insetr

set keymap=russian-jcukenwin
set iminsert=0 
set imsearch=0 
inoremap <C-l> <C-^>
