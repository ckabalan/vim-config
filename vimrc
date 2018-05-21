" Caesar Kabalan
" Critical Stuff {{{
	" Enabled vim's new features over vi. Technical Pointless in a user vimrc.
	set nocompatible
	" Load Plugins
	execute pathogen#infect()
	execute pathogen#helptags()
	" Make Backspace work like most other applications
	set backspace=2
	" Set the vim command history length
	set history=1000
	" Allows buffers to be hidden instead of closed if there are changes unwritten to disk
	set hidden
" }}}
" Hard Mode {{{
	" Disable Arrowkeys
	noremap <Up> <NOP>
	noremap <Down> <NOP>
	noremap <Left> <NOP>
	noremap <Right> <NOP>
	" Disable hjkl
	" noremap h <NOP>
	" noremap j <NOP>
	" noremap k <NOP>
	" noremap l <NOP>
	" Enable Mouse support
	" set mouse=a
	" Disable Mouse support
	set mouse=
" }}}
" Visual Settings {{{
	" Enable Syntax Highlight
	syntax on
	" Enable 256 Colors in vim
	set t_Co=256
	" Set the colorscheme
	colorscheme molokai
	" Change the encoding so font show correctly
	set encoding=utf-8
	" If we're using gVim
	if has("gui_running")
		" Set the font to Consolas, Size 14, Bold
		set guifont=Consolas:h14:b:cANSI
		" Maximize the window
		au GUIEnter * simalt ~x
	endif
" }}}
" General Shortcuts {{{
	" Set <Leader> to ,
	let mapleader=","
	" Select Tabs or Buffers below
	" Shortcut - Change Tabs
	" map <C-t>k :tabr<cr>
	" map <C-t>j :tabl<cr>
	" map <C-t>h :tabp<cr>
	" map <C-t>l :tabn<cr>
	" Shortuct - Change Buffers
	map <C-t>k :bnext<cr>
	map <C-t>j :bprevious<cr>
	map <C-t>h :bnext<cr>
	map <C-t>l :bprevious<cr>
	" Shortuct - Split Navigations
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>
	" Shortcut - Undo
	map <C-z> :undo
	" Move vertically by visual line
	nnoremap j gj
	nnoremap k gk
	inoremap jk <esc>
	" Map <Leader>u to undo tree
	nnoremap <leader>u :GundoToggle<CR>
	" Add Clipboard support
	set clipboard+=unnamed
	" Copy to clipboard
	vnoremap  <leader>y  "+y
	nnoremap  <leader>Y  "+yg_
	nnoremap  <leader>y  "+y
	nnoremap  <leader>yy  "+yy
	" Paste from clipboard
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P
" }}}
" Text Editing {{{
	" Set up Tabs
	set tabstop=4
	set ts=4
	set autoindent
	set smartindent
	set shiftwidth=4
	set scrolloff=10
	" Automatically insert the comment leader on new line (o/O)
	autocmd FileType * setlocal fo-=r fo-=o
	" Misc filetype customizations
	autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd FileType yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	" Ruby files have some weird syntax highlighting slowness
	autocmd FileType rb setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab re=1 norelativenumber nocursorline
	au! BufRead,BufNewFile *.template setlocal filetype=json tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd FileType go setlocal foldmethod=syntax
	" Stop concealing JSON quotes
	let g:vim_json_syntax_conceal = 0
	" Close YouCompleteMe preview window when you exit insert mode
	let g:ycm_autoclose_preview_window_after_insertion = 1
" }}}
" Folding {{{
	set foldenable
	set foldlevelstart=10
	set foldnestmax=10
	set foldmethod=indent
	" Comment this out if you're security concious
	" This setting forces modeline on for root
	set modeline
" }}}
" Line Numbers {{{
	set cursorline
	set number
	set relativenumber
" }}}
" EasyMotion {{{
	" EasyMotion defaults to <Leader><Leader>motion (\\w), this changes it back to
	" <Leader>motion (\w)
	map <Leader> <Plug>(easymotion-prefix)
	" EasyMotion for hjkl movement
	map <Leader>l <Plug>(easymotion-lineforward)
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)
	map <Leader>h <Plug>(easymotion-linebackward)
	" keep cursor column when JK motion
	let g:EasyMotion_startofline = 0 
	" EasyMotion <Leader>/ for search
	map <Leader>/ <Plug>(easymotion-sn)
	omap <Leader>/ <Plug>(easymotion-sn)
	map n <Plug>(easymotion-next)	" EasyMotion next in search
	map N <Plug>(easymotion-prev)	" EasyMotion prev in search
" }}}
" NERDTree {{{
	" Automatically open NERDTree with specific settings
	let g:nerdtree_tabs_open_on_console_startup=1
	let g:NERDTreeDirArrows=0
	let g:NERDTreeShowHidden=1
	" If you open Neovim without a file (such as a shortcut) it
	" lags NERDTree listing all the files, so set it to your home.
	if getcwd() == "C:\\Windows\\system32"
		cd $HOMEPATH
	endif
	autocmd VimEnter *
		\	if !argc()
		\ |		Startify
		\ |		NERDTree
		\ |		wincmd w
		\ |		execute "normal \<C-U>"
		\ |	endif
" }}}
" Airline {{{
	" Enable Airline's Tab Bar
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='molokai'
	" Enable Airline Fonts
	let g:airline_powerline_fonts = 1
" }}}
" Syntastic {{{
"        set statusline+=%#warningmsg#
"        set statusline+=%{SyntasticStatuslineFlag()}
"        set statusline+=%*
"
"        "let g:syntastic_python_python_exec = 'python3'
"        let g:syntastic_always_populate_loc_list = 1
"        let g:syntastic_auto_loc_list = 1
"        let g:syntastic_check_on_open = 1
"        let g:syntastic_check_on_wq = 0
" }}}
" Python Stuff {{{
"        " Use the most relevant python3 interpreter (even works with virtualenv)
"        let g:ycm_server_python_interpreter = 'python3'
"        let g:ycm_python_binary_path = 'python3'
"        " Highlight Bad Whitespace
"        au BufRead,BufNewFile *.py,*.pyw,*.c,*.h highlight BadWhitespace ctermbg=red guibg=darkred
"        au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"        " PEP8-compatible Indentation
"        au BufNewFile,BufRead *.py
"                \ set tabstop=4 |
"                \ set softtabstop=4 |
"                \ set shiftwidth=4 |
"                \ set textwidth=79 |
"                \ set expandtab |
"                \ set autoindent |
"                \ set fileformat=unix
"        filetype plugin indent on
" }}}
" Startify {{{
	highlight StartifyHeader ctermfg=10
	let g:startify_list_order = [
		\ ['   Bookmarks'], 'bookmarks',
		\ ['   Most Recently Used Files'], 'files',
		\ ['   Recently Modified In Current Directory'], 'dir',
		\ ['   Commands'], 'commands',
		\ ['   Sessions'], 'sessions']
	let g:startify_bookmarks=['~/.bashrc', '~/.vim/vimrc']
	function! s:filter_header(lines) abort
		let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
		let centered_lines = map(copy(a:lines),
			\ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
		return centered_lines
	endfunction
	let g:ascii_header_plaintext = s:filter_header([
		\ '                                                                               ',
		\ '                                                                               ',
		\ '                                     .%(##                                     ',
		\ '        %@@@@@@@@@@@@@@@@@@@@@@@@@   %***###      @@@@@@@@@@@@@@@@@@@@@@@@@    ',
		\ '        @%%%%%%%%%%%%%%%%%%%%%%%%.*  ******###   @%%%%%%%%%%%%%%%%%%%%%%%%(/   ',
		\ '        @%%%%%%%%%%%%%%%%%%%%%%%%.*  ********##  @%%%%%%%%%%%%%%%%%%%%%%%% /   ',
		\ '        %///* %%%%%%%%%%%%%%//////   **********   &///%%%%%%%%%%%%%%%%%%.//    ',
		\ '            @ %%%%%%%%%%%%%%//,    *************,   &@@%%%%%%%%%%%%%%%*//      ',
		\ '            @ %%%%%%%%%%%%%%//,  ***************  &@@%%%%%%%%%%%%%%%(//        ',
		\ '            @ %%%%%%%%%%%%%%//,  *************  (@@#%%%%%%%%%%%%%%%//          ',
		\ '            @ %%%%%%%%%%%%%%//,  **********,  &@@(%%%%%%%%%%%%%%%//            ',
		\ '            @ %%%%%%%%%%%%%%//,  *********  #@@/%%%%%%%%%%%%%%%//              ',
		\ '            @ %%%%%%%%%%%%%%//,  *******  &@@*%%%%%%%%%%%%%%%//                ',
		\ '            @ %%%%%%%%%%%%%%//,  ****,  #@@,%%%%%%%%%%%%%%%//                  ',
		\ '            @ %%%%%%%%%%%%%%//,  **,  @@@.%%%%%%%%%%%%%%%//   *##(             ',
		\ '            @ %%%%%%%%%%%%%%//,     @@@.%%%%%%%%%%%%%%%//   *****###           ',
		\ '            @ %%%%%%%%%%%%%%//,   @@@ %%%%%%%%%%%%%%%,/.  ,********##(         ',
		\ '       ,%%  @ %%%%%%%%%%%%%%//, @@@ %%%%%%%%%%%%%%%,/,  *************###       ',
		\ '      %%,*  @ %%%%%%%%%%%%%%// @@.%%%%%%%%%%%%%%% /*  .****************##(     ',
		\ '   ,%%****  @ %%%%%%%%%%%%%%/*@.%%%%%%%%%%%%%%% //  .********************###   ',
		\ '   ,,,****  @ %%%%%%%%%%%%%%/,%%%%%%%%%%%%%%% //   ********************** ,.   ',
		\ '     ,,,**  @ %%%%%%%%%%%%%%%%%%%%%%%%%%%%% //   ********************** ,.     ',
		\ '       ,,,  @ %%%%%%%%%%%%%%%%%%%%%%%%%%       ********************** ,.       ',
		\ '         ,  @ %%%%%%%%%%%%%%%%%%%%%%%%% %%%%% ********************* ,.         ',
		\ '            @ %%%%%%%%%%%%%%%%%%%%%%%% .%%%% .******************* ,.           ',
		\ '            @ %%%%%%%%%%%%%%%%%%%%%%//   ********************** ,.             ',
		\ '            @ %%%%%%%%%%%%%%%%%%%%.         **       ****      .               ',
		\ '            @ %%%%%%%%%%%%%%%%%%// %%%%%%% ,* %%%%%%%    %%%%%%   %%%%%%%      ',
		\ '            @ %%%%%%%%%%%%%%%%//   * %%%%% *** %%%%%%%%%%%%%%%%%%%%%%%%%       ',
		\ '            @ %%%%%%%%%%%%%%//   ** %%%%% ***, %%%%      %%%%      %%%%%       ',
		\ '            @ %%%%%%%%%%%%//   *** #%%%% ,*** %%%% .* , %%%%%      %%%%        ',
		\ '            @ %%%%%%%%%%*/   ****. %%%%# *** #%%%%  ,,  %%%%      %%%%/        ',
		\ '            @ %%%%%%%%./   ,,.*** %%%%% ***. %%%% ,.   %%%%,     %%%%%         ',
		\ '            @ %%%%%% /       ,,. %%%%%  *** %%%%.      %%%%      %%%%          ',
		\ '             @//////             %%%%%%* * %%%%%%     %%%%%*    %%%%%%         ',
		\ '                                 ,,,******* ,.                                 ',
		\ '                                   ,,.*** ,.                                   ',
		\ '                                     ,,.,.                                     ',
		\ '                                       ,                                       '])

	let g:ascii_header_shading = s:filter_header([
		\ '                                                                                ',
		\ '                                        ▄                                       ',
		\ '                                     ,▄▀██▄                                     ',
		\ '       ▄█████████████████████████████▀░░▓▒▀█▄   ▄████████████████████████████▄  ',
		\ '      ██▀¿ªªªªªªªªªªªªªªªªªªªªªªª≡▄███▓▓▓▓▓▒▒█▄███ ªªªªªªªªªªªªªªªªªªªªªªªΣ,██▌ ',
		\ '      ██.▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╣███▓▓▓▓▓▓▓▒▒███]▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌██▌ ',
		\ '      ██▄╙▄▄▄@░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓▓▓╗╢███▓▓▓▓▓▓▓▓▓███ ▒▓▓▄░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╣██▌ ',
		\ '       ▀█████ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓██████▓▓▓▓▓▓▓▓▓▓▓█████▀ ║▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▓╢███▀  ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▀ ,ª░▒▒▒▒▒▒▒▒▒▒▒▒░▄▓╢███     ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓▓▓▓▓▓▓▓███▀ ,▒░▒▒▒▒▒▒▒▒▒▒▒▒░▄▓╢██▀       ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓▓▓▓▓▓███  ╓▒░▒▒▒▒▒▒▒▒▒▒▒▒░g╣▄██▀         ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓▓▓▓██▀  ╒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░╣╢███▀           ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓███▀  ╔▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╣███▀             ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓███▀  f▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╢███▀█▄             ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓███▀ ,ª░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╢███▓▓▓▒▒█▄           ',
		\ '         ▄██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓█████  ,▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▄▓╢███▓▓▓▓▓▓▓▒▒█▄         ',
		\ '       ▄█░██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓██▀  ╓▒░▒▒▒▒▒▒▒▒▒▒▒▒░▄▓▄███▓▓▓▓▓▓▓▓▓▓▓▒▒██▄      ',
		\ '    ,▄▀░░▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓▀  ╒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░@▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▀█▄    ',
		\ '  ▄█▀░░▓▓▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▀ ╔▒▒▒▒▒▒▒▒▒▒▒▒▒▒░@╣████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▀█▄  ',
		\ " '██▓█▓▓▓▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓φ▒▒▒▒▒▒▒▒▒▒▒▒▒▒░╣╢████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████` ",
		\ '    ▀█▓▓▓▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒░╣╢████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓█▀`   ',
		\ '      ▀█▓▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄█▀▀▀▀█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▀      ',
		\ '        ▀███▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▀        ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▓██▄▄▄██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▀          ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▄▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▀            ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░g▓█▀▀▀▀▀▀▀██▓█▀▀▀▀▀▀█████▀▀▀▀▀███▄▀▀▀▀▀▀█      ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░@╢█████▒▒▒▒██▓▓██░▒▒▒▒▒░░░░▒▒▒▒▒░░░░▒▒▒▒▒▒█▌     ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╢████▓█░▒▒▒░█▓▓▓█▌▒▒▒░██████▒▒▒▒██████░▒▒▒▐█      ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒░▓╢████▓▓█░▒▒▒░█▓▓▓██░▒▒░█▓▓███░▒▒▒▐▌   █░▒▒▒░█       ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒░▓╢███▓▓▓▓█▌▒▒▒▒██▓▓▓█░▒▒▒██████▌▒▒▒░█   ▐█▒▒▒▒█▌       ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▄▓▄███▓▓▓▓▓██▒▒▒▒██▓▓▓█░▒▒▒▐█▓████▒▒▒░█   ,█░▒▒▒▐█        ',
		\ '          ██▌ ░▒▒▒▒▒▄▓███▀  ▀█▓▓██░▒▒▒░██▓▓█▌▒▒▒░██▀` █░▒▒▒██▄  █░▒▒▒░█▄        ',
		\ '          ▀████████████▀      ▀██▄▄▄▄▄▄▄█▓▓█▄▄▄▄▄██  ▐█▄▄▄▄▄█  ▐█▄▄▄▄▄▄█        ',
		\ '             ▀▀▀▀▀▀▀▀▀          ▀██▓▓▓▓▓▓▓▓████▀                                ',
		\ "                                  '██▓▓▓▓████▀                                  ",
		\ '                                     ▀█▓███                                     ',
		\ '                                       ▀▀                                       '])
	let g:startify_custom_header = g:ascii_header_shading
" }}}
" vim:foldmethod=marker:foldlevel=0
