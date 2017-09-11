GuiFont Consolas:h16:b
call GuiWindowMaximized(1)
autocmd VimEnter *
		\	if !argc()
		\ |		Startify
		\ |		NERDTree
		\ |		wincmd w
		\ |		execute "normal \<C-U>"
		\ |	endif