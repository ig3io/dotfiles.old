call pathogen#infect()

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set autoindent
set nu

"au FileType make set noexpandtab
au FileType ruby set softtabstop=2 shiftwidth=2 tabstop=2

" 16 color terminal
set t_Co=16
set background=dark
colorscheme solarized

" Indentation rules for Libav: 4 spaces, no tabs.
set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set cinoptions=(0

"" Allow tabs in Makefiles.
"  autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
"" Trailing whitespace and tabs are forbidden, so highlight them.
"  highlight ForbiddenWhitespace ctermbg=red guibg=red
"  match ForbiddenWhitespace /\s\+$\|\t/
"" Do not highlight spaces at the end of line while typing on that line.
"  autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab "shiftwidth=8 softtabstop=8
" Trailing whitespace and tabs are forbidden, so highlight them.
"highlight ForbiddenWhitespace ctermbg=red guibg=red
"match ForbiddenWhitespace /\s\+$\|\t/+$\
" Do not highlight spaces at the end of line while typing on that line.
"autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

set laststatus=2
let g:airline_powerline_fonts = 1
