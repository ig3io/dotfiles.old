execute pathogen#infect()
filetype plugin indent on

set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab
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
set t_Co=256
colorscheme darktango

au FileType ruby set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
au FileType html set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
au FileType css set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
au FileType python set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
au FileType make set noexpandtab
au FileType vim set expandtab

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

autocmd BufWritePre *.cpp :call TrimWhiteSpace()
autocmd BufWritePre *.h :call TrimWhiteSpace()
autocmd BufWritePre *.rb :call TrimWhiteSpace()

" ctags
set tags+=~/.vim/tags/cpp
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
