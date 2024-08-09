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
set tabstop=4
set expandtab
set shiftwidth=4

set iskeyword-=_

au Filetype python setl et ts=4 sw=4
au Filetype cs setl ts=4 sw=4
au Filetype html setl ts=2 sw=2

nnoremap ,<space> :nohlsearch<CR>
autocmd FileType python set colorcolumn=79

" Хоткеи для петухона
nnoremap <F5> :w<CR>:tabe term://.//python3 %<CR>

cnoreabbrev pyt :tabe term://.//python3 %
cnoreabbrev dn :term dotnet run %

autocmd TabClosed * tabprevious

" йцукен
set keymap=russian-jcukenwin
inoremap <C-l> <C-^>
set iminsert=0 " Set defualt qwerty


" tabs
nnoremap <silent> tn <Cmd>:tabnext<CR>
nnoremap <silent> tp <Cmd>:tabprevious <CR>


" Плигины

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('~/.vim/plugged')
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
" Plug 'mason-lspconfig.nvim'
" Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'

"Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap'
Plug 'jay-babu/mason-nvim-dap.nvim'
Plug 'mfussenegger/nvim-dap-python'

Plug 'mfussenegger/nvim-lint'
"Plug 'nvimtools/none-ls-extras.nvim'
"Plug 'nvimtools/none-ls.nvim'
" Plug 'mhartington/formatter.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'AckslD/muren.nvim'
Plug 'Pocco81/auto-save.nvim'
Plug 'gennaro-tedesco/nvim-jqx'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'stevearc/aerial.nvim'
Plug 'scrooloose/nerdtree'
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'alvan/vim-closetag'

Plug 'echasnovski/mini.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'morhetz/gruvbox'
call plug#end()

" Цветовая схема

let g:gruvbox_italic = 1
colorscheme gruvbox

set cursorline
set cursorlineopt=number

" Find files using Telescope command-line sugar.
nnoremap ,ff <cmd>Telescope find_files<cr>
nnoremap ,fg <cmd>Telescope live_grep<cr>
nnoremap ,fb <cmd>Telescope buffers<cr>
nnoremap ,fh <cmd>Telescope help_tags<cr>

nnoremap ne <cmd>AerialToggle<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" Function to open the file or NERDTree or netrw.
"   Returns: 1 if either file explorer was opened; otherwise, 0.
function! s:OpenFileOrExplorer(...)
    if a:0 == 0 || a:1 == ''
        NERDTree
    elseif filereadable(a:1)
        execute 'edit '.a:1
        return 0
    elseif a:1 =~? '^\(scp\|ftp\)://' " Add other protocols as needed.
        execute 'Vexplore '.a:1
    elseif isdirectory(a:1)
        execute 'NERDTree '.a:1
    endif
    return 1
endfunction

if !exists('g:AutoPairsShortcutToggle')
  let g:AutoPairsShortcutToggle = '<M-,>'
end

" Command to call the OpenFileOrExplorer function.
command! -n=? -complete=file -bar Edit :call <SID>OpenFileOrExplorer('<args>')

" Command-mode abbreviation to replace the :edit Vim command.
cnoreabbrev e Edit

" Main init in lua
source ~/.config/nvim/main.lua

" CMP & LSP
" Ctrl + Space for activate cmp
source ~/.config/nvim/cmp.lua
set completeopt=menu,menuone,noselect

" LSP
source ~/.config/nvim/lsp.lua
" source ~/.config/nvim/pyright.lua

" Telescope
source ~/.config/nvim/telescope.lua

" Auto save
source ~/.config/nvim/auto-save.lua

" Treesitter
source ~/.config/nvim/treesitter.lua

" Aerial
sourc ~/.config/nvim/aerial.lua
