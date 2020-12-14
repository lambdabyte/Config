
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


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
set number
highlight LineNr ctermfg=37


" IDE config
syntax on



















































