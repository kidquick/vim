" GUI options
set guioptions-=T		" disable toolbar
set guioptions-=r		" disable right hand scrollbar
set guioptions-=L		" disable left hand scroll bar
set guioptions-=t		" disable tearoff menu items
"set guioptions-=m	" disable menu bar

" disable audio bell and visual bell (important for gvim on Windows only)
if has("win32")
	set vb t_vb=
endif

" Visual theme
colorscheme solarized				" must be in ~/.vim/colors/solarized.vim
set background=dark
