execute pathogen#infect()
filetype plugin indent on

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent

set norelativenumber
set number

set encoding=utf-8

set ruler
set scrolloff=10
set cursorline
set wildignore+=.git/*,.gitignore,*.class,*.o,*.pyc,*.tar.*,*.tgz,*.zip,*.rar,__*__
set laststatus=2

syntax on

set background=dark
colorscheme solarized

autocmd FileType python set shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType c set shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType cpp set shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType make set noexpandtab

" Key bindings
nnoremap <C-l> gt
nnoremap <C-h> gT

" Relative numbers
function! Number()
    set norelativenumber
    set number
endfunction

function! RelativeNumber()
    set number
    set relativenumber
endfunction

function! NumberToggle()
    if(&relativenumber == 1)
        call Number()
    else
        call RelativeNumber()
    endif
endfunc

nnoremap <silent> <C-c> :call NumberToggle()<cr>

autocmd InsertEnter * call Number()
"autocmd InsertLeave * call RelativeNumber()

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

autocmd BufWritePre *.rb :call TrimWhiteSpace()
autocmd BufWritePre *.py :call TrimWhiteSpace()

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Mouse (blasfemy!)
set mouse=a
