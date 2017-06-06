set nocompatible
filetype off
if has("unix")
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
elseif has("win32")
  let $desk=$USERPROFILE.'\Desktop'
  cd $desk  " for work only
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  call vundle#begin('~/vimfiles/bundle')
endif
Plugin 'VundleVim/Vundle.vim'

" Ruby Rails
"Plugin 'vim-ruby/vim-ruby'		" Ruby wrapper
"Plugin 'tpope/vim-rails'			" Rails wrapper
"Plugin 'tpope/vim-rake'			" Rake wrapper
"Plugin 'tpope/vim-bundler'		" Bundle wrapper
"Plugin 'tpope/vim-fugitive'	" Git wrapper
"Plugin 'tpope/vim-endwise'		" Auto-insert closing tag/quote/parenthesis (Ruby/C/bash only)
"Plugin 'tpope/vim-surround'	" Quoting/parenthesizing editing
"Plugin 'tpope/vim-commentary'" Comment blocks with gc or gcc

" Ruby auto-complete
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
"autocmd FileType ruby,eruby let g:rubycomplete_rails=1
"if has("unix")
"  Plugin 'Valloric/YouCompleteMe'
"  let g:ycm_seed_identifiers_with_syntax = 1
"elseif has("win32")
"  set complete-=i		" for slow Ctrl-N performance (Windows only)
"endif

" File tree browsing
Plugin 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen = 1

" Fuzzy file searching
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|tmp)$',
  \ 'file': ''
  \ }

" XHTML auto-complete
Plugin 'alvan/vim-closetag'	" Auto-complete XHTML tags
let g:closetag_filenames = "*.htm,*.html,*.xhtml"

" Session management
"Plugin 'xolox/vim-misc'			" base class for xolox plugins
"Plugin 'xolox/vim-session'		" session manager
"let g:session_autosave = 'yes'
"let g:session_autoload = 'yes'

" Solarized theme
Plugin 'altercation/vim-colors-solarized'

" Airline bar
Plugin 'powerline/powerline'
Plugin 'powerline/fonts'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
set laststatus=2					" always show status line

" All Vundle plugins must be added before the following line
call vundle#end()


" Display settings
syntax on
filetype plugin indent on
colorscheme solarized
set background=dark
set t_Co=256								" Important! (vim.wikia.com/wiki/256_colors_in_vim)
set encoding=utf-8          " The encoding displayed
set fileencoding=utf-8      " The encoding written to a file
set number		" enable line numbers
winpos 0 0		" open vim window at (0, 0)
set wrap linebreak nolist
set autowriteall
set diffopt=vertical	" diff always opens in vertical split
set backspace=indent,eol,start		" allow backspace over whitespace
set nohidden		" when closing tab, remove the buffer
if has("unix")
  set clipboard=unnamedplus 	" yanks go on system clipboard
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
  set lines=30
  set columns=100
  set fileformat=unix
elseif has("win32")
  set clipboard=unnamed 	" yanks go on system clipboard
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
  set lines=62
  set columns=140
  set fileformat=dos
endif
"set scrolloff=9999		" cursor stays in vertical center
"let loaded_matchparen = 1		" set showmatch
"set mat=5							" bracket blinking

" Undo settings
set undofile					" persistent undo
set undolevels=1000		" number of undo's to remember
set undoreload=10000	" when a file is edited externally and reloaded in vim

" Backup, swap and undo folders
set backupcopy=yes
if has("unix")
  set backupdir=~/.vim/.backup
  set directory=~/.vim/.swap
  set undodir=~/.vim/.undo
elseif has("win32")
  set backupdir=$HOME/vimfiles/backup
  set directory=$HOME/vimfiles/swap
  set undodir=$HOME/vimfiles/undo
endif

" Tab settings
"set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2  " tabs preferred
set tabstop=2 expandtab shiftwidth=2  " spaces preferred
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Search highlighting (disable with :noh)
set ignorecase
set smartcase	" case-sensitive iif search contains an uppercase character
set hlsearch	" use :noh to clear highlights
set incsearch	" search while typing the search instead of waiting for <CR>
set wildignore+=.git,tmp,**/log/**	" Search within project

" Split settings
set splitright		" new buffer vsplits open on right
set splitbelow		" new buffer splits open on bottom

" Auto indent
set smartindent
set autoindent

" Remove trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Restore cursor position, window position, and last search after running a command
function! Preserve(command)
  let search = @/		" Save the last search
  let cursor_position = getpos('.')		" Save the current cursor position
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)
  execute a:command
  let @/ = search		" Restore the last search
  call setpos('.', window_position)		" Restore the previous window position
  normal! zt
  call setpos('.', cursor_position)		" Restore the previous cursor position
endfunction

" HTML tidy
function! HtmlTidy()
  normal! mz	" save cursor position
  "g/^$/d	" delete empty lines
  "call <SID>StripTrailingWhitespaces()
  "normal! gg=G	" indent
  "RetabIndent
  !tidy -i -o % -wrap 0 --show-errors 0 %
  normal! `z	" restore cursor position
endfunction

" Save while creating all parent dirs
if !exists('*WriteCreatingDirs')
  function WriteCreatingDirs()
    execute ':silent !mkdir %:h'
    write
  endfunction
  command W call WriteCreatingDirs()
endif

" Folding settings
set foldmethod=manual   " fold based on intent
inoremap <F9> <C-O>za		" toggle fold with F9
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Ruby ctags for gems (guard-ctags-bundler)
"set tags+=gems.tags

" regex: multiline search and replace (remove all javascripts)
" \_. = all characters including newline (ie multiline)
" {-} = non-greedy wildcard
"%s#<script\_.\{-}</script>##g

" Indent on save
"autocmd BufWritePre <buffer> call Preserve('normal gg=G')

" Keyboard shortcuts
let mapleader=","								" change default leader to comma
nnoremap k gk
nnoremap j gj
nnoremap <silent> gh :bp!<CR>		" buffer left
nnoremap <silent> gl :bn!<CR>		" buffer right
nnoremap <C-h> <C-w>h						" window left
nnoremap <C-j> <C-w>j						" window down
nnoremap <C-k> <C-w>k						" window up
nnoremap <C-l> <C-w>l						" window right
nnoremap <A-]> <C-t>						" tag stack back
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>
nnoremap <C-a> :tabe $MYVIMRC<CR>				" edit .vimrc in a new tab
nnoremap <C-CR> i<CR><ESC>			" insert new line
nnoremap <leader>w :w!<CR>			" save
nnoremap <leader>q <C-w>q				" window quit
nnoremap <silent> <leader>n :NERDTreeToggle<CR>		" open NERDtree
inoremap <C-@> <C-x><C-o>				" Ctrl-space for omnicomplete
vnoremap <F4> :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>	" Recursive search
vnoremap // y/<C-R>"<CR>				" search within file for highlighted word
nnoremap <silent> <F12> :call HtmlTidy()<CR>
"nnoremap <M-j> <C-e>						" screen down one line
"nnoremap <M-k> <C-y>						" screen up one line
"nnoremap <F3> ggVGg?						" ROT13 scramble

" search and replace highlighted word within file
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
