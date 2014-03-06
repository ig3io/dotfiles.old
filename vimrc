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

set laststatus=2
set viminfo+=n~/Development/.viminfo

" Key bindings
nnoremap <C-l> gt
nnoremap <C-h> gT

" Trailing whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre *.cpp :call TrimWhiteSpace()
autocmd BufWritePre *.c :call TrimWhiteSpace()
autocmd BufWritePre *.hpp :call TrimWhiteSpace()
autocmd BufWritePre *.h :call TrimWhiteSpace()
autocmd BufWritePre *.rb :call TrimWhiteSpace()
autocmd BufWritePre *.py :call TrimWhiteSpace()

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
