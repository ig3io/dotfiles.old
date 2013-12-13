execute pathogen#infect()
filetype plugin indent on

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set encoding=utf-8
set ruler
set norelativenumber
set scrolloff=10
set nu
syntax on
set wildignore+=.git/*,.gitignore,*.class,*.o,*.pyc,*.tar.*,*.tgz,*.zip,*.rar,__*__
set laststatus=2
set background=dark
colorscheme darktango

au FileType ruby set shiftwidth=2 softtabstop=2 tabstop=2
au FileType make set noexpandtab

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
