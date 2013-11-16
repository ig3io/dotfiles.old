execute pathogen#infect()
filetype plugin indent on

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set scrolloff=10
set nu
syntax on

set background=dark
set t_Co=16

au FileType ruby set shiftwidth=2 softtabstop=2 tabstop=2
au FileType make set noexpandtab

set laststatus=2

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

set laststatus=2
"let g:airline_powerline_fonts = 1
