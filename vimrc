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

colorscheme darktango
set t_Co=256
set background=dark

au FileType ruby set shiftwidth=2 softtabstop=2 tabstop=2
au FileType make set noexpandtab


autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Lightline

set laststatus=2
