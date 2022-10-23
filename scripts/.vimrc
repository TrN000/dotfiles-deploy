"basics
execute pathogen#infect()

syntax on
filetype plugin indent on
set t_Co=16
set nocompatible
set encoding=utf-8
set number
let &tabpagemax=50
set hlsearch incsearch
set lcs=eol:$,trail:¶,tab:<->,space:·



set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" tpope plugins
Plugin 'tpope/vim-fugitive'
" auto-completer
Plugin 'ycm-core/YouCompleteMe'
" hex colors
Plugin 'chrisbra/Colorizer'
" nerdtree
Plugin 'preservim/nerdtree'
" theme
Plugin 'tomasiser/vim-code-dark'
" theme
Plugin 'dunstontc/vim-vscode-theme'
" fancy status bar
Plugin 'vim-airline/vim-airline'
" fancy status bar
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"for autowrap use set formatoptions+=a; set textwidth=78
"trailing whitespace: autocmd BufWritePre * %s/\s\+$//e
"for list mode: set list; set nolist;

" color scheme
colorscheme codedark
set termguicolors

" copy and paste with clipboard
vnoremap <C-c> "+y

"move through tabs
nnoremap ä gt
nnoremap ö gT

"set leader (shadows a search function)
let mapleader=","
let maplocalleader=","

"faster vimscript coding
nnoremap <leader>vc :tabe $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>
nnoremap <leader>vt :source %:p<cr>

" misc
nnoremap <leader>ks mw:%s/ \{1,\}$//<CR>`w
nnoremap <leader>? o<ESC>080i=<ESC>o<ESC>:r! date<CR>o<CR><ESC>k
nnoremap <C-p>     gqip
nnoremap <leader>d mwIDONE: <ESC>`w
nnoremap <leader>w mwIWIP: <ESC>`w
nnoremap <leader>D mw^^dW`w
nnoremap <C-¨> <C-]>

" misc function key maps
nnoremap <F2>  :<C-U>execute "! " . getline('.')<CR>
nnoremap <F3>  :<C-U>set nu!<CR>
nnoremap <F4>  :<C-U>set rnu!<CR>

" quickfix-window
nnoremap <F5>  :cclose<CR>
nnoremap <F6>  :copen<CR>
nnoremap <F7>  :cprev<CR>
nnoremap <F8>  :cnext<CR>

" make commands
nnoremap <F9>  :make test<CR>
nnoremap <F10> :make clean<CR>
nnoremap <F11> :make -B<CR>
nnoremap <F12> :make<CR>

" ycm specific
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
nmap <leader>k <plug>(YCMHover)
nnoremap <leader>K :YcmCompleter GetDoc<CR>

"netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_altv=1

"nerdtree
nnoremap <leader>nt :NERDTreeFocus<CR>
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"tabs vs spaces situation
set tabstop=4 shiftwidth=4 expandtab
set foldmethod=indent
autocmd BufRead * normal! zR

"for R plugin
let R_args = ['--vanilla']

"some color correction
highlight SpellBad ctermfg=1
highlight SpellCap ctermfg=1
highlight SpellRare ctermfg=1
highlight SpellLocal ctermfg=1
highlight Search ctermfg=0

" Colorizer plugin
let g:colorizer_auto_filetype='css,html'

"some fun
autocmd VimEnter * echo '(>^w^<) Gutta cavat lapidem'

"Termlink keybinds
nnoremap <leader>s :call Termlink_start()<cr>
nnoremap ł :<C-U>call Termlink_send()<cr>j
vnoremap ł :<C-U>call Termlink_send(Get_visual_selection())<cr>gv
nnoremap <leader>l :<C-U>call Termlink_send("\<c-l>", "")<cr>
nnoremap <leader>q :<C-U>call Termlink_send("\<c-d>", "")<cr>

" textwidth for markdown files
autocmd FileType markdown setlocal textwidth=90

"find and replace
nnoremap S :%s//g<Left><Left>

"vim-template stuff
let g:email="nicolas.trutmann@gmx.ch"

" status line
set statusline =%f\ -\ %y\ buf:\ %n
set statusline+=%=%c\,%l%8l/%L\ \|\ %2p%%
set laststatus=2
