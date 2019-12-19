" Powerline
set  rtp+=/home/thicc/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
let mapleader=" "
let g:rainbow_active = 1
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

" enables a DSL (a Domain specific language) for your plugin configurations
call plug#begin('~/.vim/plugged')
" inside these 'call lines' you can write 'Plug' instructions
" that specify each plugin you want to install

Plug 'Raimondi/delimitMate'
Plug 'luochen1990/rainbow'


call plug#end()


