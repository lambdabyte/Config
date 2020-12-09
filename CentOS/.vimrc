
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Code Completion
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" " List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Patch airline themes
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
	if g:airline_theme == 'badwolf'
		for colors in values(a:palette.inactive)
			let colors[3] = 245
		endfor
	endif
endfunction

" Airline Themes
let g:airline_powerline_fonts=1
let g:airline_theme='base16_shapeshifter'
let g:airline_statusline_ontop = 0
let g:airline_section_warning= 0
"do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Default
set laststatus=2 
set t_Co=256

" Deoplete Auto Complete Config

" Don't forget to start deoplete let g:deoplete#enable_at_startup = 1 " Less
" spam let g:deoplete#auto_complete_start_length = 2 
" " Use smartcase
let g:deoplete#enable_smart_case = 1
" " Setup completion sources
let g:deoplete#sources = {}

" " IMPORTANT: PLEASE INSTALL JAVACOMPLETE2  AND ULTISNIPS OR DONT ADD THIS
" LINE!
" " =====================================

" let g:deoplete#sources.java = ['jc', 'javacomplete2', 'file', 'buffer','ultisnips']

" " =====================================

" use TAB as the mapping
inoremap <silent><expr> <TAB>
	\ pumvisible() ?  "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
	let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
endfunction "" }}}

"Java completion
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"autocmd FileType java JCEnable
























