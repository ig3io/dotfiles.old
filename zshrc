PROMPT='%{$fg_bold[yellow]%}%n%{$fg[blue]%}%{$reset_color%} %{$fg[blue]%}%{$fg_bold[blue]%}%~ %{$reset_color%}$(git_prompt)$(vi_prompt)%{$fg_bold[yellow]%}%(!.#.$)%{$reset_color%} '

export DIRSTACKFILE=~/.zdirs
export DIRSTACKSIZE=8
export GREP_OPTIONS='--color=always'
export HISTFILE=$HOME/.zhistory
export HISTSIZE=50000
export KEYTIMEOUT=1
export LESS='-R'
export PATH=~/bin/:~/.gem/ruby/2.0.0/bin:$PATH
export SAVEHIST=10000
export ZLS_COLORS=$LS_COLORS

stty -ixon

autoload -U colors && colors
autoload -U compinit && compinit

setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_GLOB
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt NO_FLOW_CONTROL
setopt PROMPT_SUBST
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
setopt PUSHD_SILENT
setopt PUSHD_TOHOME
setopt VI

## ZSTYLE ##
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' users off
zstyle ':completion:*' verbose yes
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:hosts' hosts $hosts

## BINDKEYS ##
bindkey -v '^r' history-incremental-pattern-search-backward
bindkey -v '^f' history-incremental-pattern-search-forward
bindkey -a 'n' down-line-or-search
bindkey -a 'p' up-line-or-search
bindkey -v '^[[3~' delete-char
bindkey -v '^[[7~' beginning-of-line
bindkey -v '^[[8~' end-of-line
bindkey -v '^[[Z' reverse-menu-complete
bindkey -v '^k' kill-buffer
bindkey -v '^m' check-line
bindkey -v '^n' down-line-or-search
bindkey -v '^p' up-line-or-search
bindkey -v '^s' insert-sudo

## ALIASES ##
alias ack="ack-grep --color"
alias cal="cal -3"
alias cd=" cd"
alias diff="diff -yEbwB --suppress-common-lines"
alias ls=" ls --color=auto"
alias sl="ls"
alias l="ls -h"
alias ll="ls -lh"
alias la="ls -lah"
alias csyntax="clang -fsyntax-only"
alias canalyze="clang --analyze"


## SNIPPETS ##
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi

## FUNCTIONS ##
insert-sudo() {
    sudo="sudo "
    BUFFER="$sudo$BUFFER"
    CURSOR=$(expr $CURSOR + $(expr length $sudo))
}
zle -N insert-sudo

chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

extract() {
    file=$1
    filename=$(basename "$file")
    extension="${filename#*.}"
    echo "extracting: $extension"
    case $extension in
        'zip')
            unzip $file
            ;;
        'tar.gz')
            tar -xzvf $file
            ;;
    esac
}

check-line() {
    if [ "$BUFFER" = "" ]; then
        return
    fi
    zle accept-line
}
zle -N check-line

# VI
zle-keymap-select() {
    zle reset-prompt
}
zle -N zle-keymap-select

vi_prompt() {
    INDICATOR="%{$reset_color%}$fg[cyan]:vi%{$reset_color%} "
    if [ "$KEYMAP" = "vicmd" ]; then
        echo $INDICATOR
    fi
}

# GIT
git_prompt() {
    if git rev-parse --git-dir >/dev/null 2>&1; then
        ref=$(git symbolic-ref HEAD 2>/dev/null || git name-rev --name-only --no-undefined --always HEAD)
        ref=${ref#refs/heads/}
        extra="*"
        if git diff --quiet --ignore-submodules HEAD >/dev/null 2>&1; then
            extra=""
        fi
        echo "%{$fg[yellow]%}($ref$extra)%{$reset_color%} "
    fi
}

# from http://stackoverflow.com/a/904023
function mandelbrot {
    local lines columns colour a b p q i pnew
    ((columns=COLUMNS-1, lines=LINES-1, colour=0))
    for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
        for ((a=-2.0; a<=1; a+=3.0/columns)) do
            for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
                ((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
            done
            ((colour=(i/4)%8))
            echo -n "\\e[4${colour}m "
        done
        echo
    done
}

# Android NDK
export NDK_HOME=$HOME/Development/Android/NDK
export PATH=$PATH:$NDK_HOME

# Stuff that should go to xinitrc
xrdb ~/.Xresources

# $HOME/bin folder
export PATH=$PATH:$HOME/bin

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
