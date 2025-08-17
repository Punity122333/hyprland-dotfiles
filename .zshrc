# ---------------------------------
#   ~/.zshrc - Ultimate Setup w/ Aliases & Features
# ---------------------------------
sleep 0.3
# --------- INSTANT PROMPT ---------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/starship/init.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/starship/init.zsh"
fi

# --------- FASTFETCH / PFETCH CONDITIONAL ---------
if command -v fastfetch &>/dev/null && command -v pfetch &>/dev/null; then
    if [[ $(tput cols) -ge 80 && $(tput lines) -ge 24 ]]; then
        fastfetch
    else
        pfetch
    fi
elif command -v fastfetch &>/dev/null; then
    if [[ $(tput cols) -ge 80 && $(tput lines) -ge 24 ]]; then
        fastfetch
    fi
elif command -v pfetch &>/dev/null; then
    pfetch
fi

# --------- HISTORY SETTINGS ---------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS SHARE_HISTORY INC_APPEND_HISTORY

# --------- COMPLETION ---------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' group-name ''

# --------- ALIASES ---------
# bat instead of cat
if command -v bat &>/dev/null; then
    alias cat='bat --style=plain --paging=never'
fi

# exa instead of ls
if command -v exa &>/dev/null; then
    alias ls='exa --icons --group-directories-first --color=always'
    alias ll='exa -lah --icons --group-directories-first'
    alias la='exa -a --icons --group-directories-first'
fi

alias cls='clear'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias v='nvim'
alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias cbcopy='xclip -selection clipboard'
alias cbpaste='xclip -selection clipboard -o'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias cls="clear; source ~/.zshrc"
alias code="ELECTRON_OZONE_PLATFORM_HINT=x11 code --disable-gpu --no-sandbox"

# --------- UNIVERSAL EXTRACT FUNCTION ---------
extract () {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"   ;;
            *.tar.gz)    tar xzf "$1"   ;;
            *.bz2)       bunzip2 "$1"   ;;
            *.rar)       unrar x "$1"   ;;
            *.gz)        gunzip "$1"    ;;
            *.tar)       tar xf "$1"    ;;
            *.tbz2)      tar xjf "$1"   ;;
            *.tgz)       tar xzf "$1"   ;;
            *.zip)       unzip "$1"     ;;
            *.Z)         uncompress "$1";;
            *.7z)        7z x "$1"      ;;
            *.xz)        unxz "$1"      ;;
            *.tar.xz)    tar xf "$1"    ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# --------- STARSHIP PROMPT ---------
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# --------- ZSH PLUGINS ---------
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.zsh_custom}"

# Autosuggestions
if [ ! -d "$ZSH_CUSTOM/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/zsh-autosuggestions"
fi
source "$ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax Highlighting
if [ ! -d "$ZSH_CUSTOM/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/zsh-syntax-highlighting"
fi
source "$ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# History Substring Search
if [ ! -d "$ZSH_CUSTOM/zsh-history-substring-search" ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_CUSTOM/zsh-history-substring-search"
fi
source "$ZSH_CUSTOM/zsh-history-substring-search/zsh-history-substring-search.zsh"

# --------- FZF-TAB with Preview ---------
if [ ! -d "$ZSH_CUSTOM/fzf-tab" ]; then
    git clone https://github.com/Aloxaf/fzf-tab "$ZSH_CUSTOM/fzf-tab"
fi
source "$ZSH_CUSTOM/fzf-tab/fzf-tab.plugin.zsh"

# Small bat preview for files, ls for dirs
zstyle ':completion:*:default' fzf-preview '[[ -f $realpath ]] && bat --style=plain --color=always --line-range=:5 $realpath || ls --color=always $realpath'

# FZF-tab bindings
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' accept-line 'ctrl-space'
zstyle ':fzf-tab:*' toggle-preview 'ctrl-s'

# Default FZF options for previews
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --preview-window=up:8:wrap \
  --height=40% \
  --layout=reverse \
  --border"

# Git branch in tab-completion
zstyle ':completion:*:*:git-checkout:*' sort false
zstyle ':completion:*:*:git-checkout:*' tag-order 'branches' 'tags'

# --------- FZF INTEGRATION ---------
if command -v fzf &>/dev/null; then
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# --------- AUTO CD W/ DIRECTORY HISTORY ---------
setopt autocd autopushd pushdignoredups pushdminus
alias cdprev='cd -'  # cycles like browser tabs

# --------- AUTOLOAD CUSTOM FUNCTIONS ---------
fpath=(~/.zsh_functions $fpath)

# --------- BUILT-IN TIMER FOR COMMANDS ---------
REPORTTIME=5
preexec() { timer=$(date +%s) }
precmd() {
    if [[ -n "$timer" ]]; then
        now=$(date +%s)
        elapsed=$(( now - timer ))
        if (( elapsed > REPORTTIME )); then
            echo "⏱ Command took ${elapsed}s"
        fi
        unset timer
    fi
}

# --------- AUTO VENV ACTIVATION ---------
function auto_venv() {
    if [[ -f "venv/bin/activate" ]]; then
        source venv/bin/activate
    elif [[ "$VIRTUAL_ENV" != "" && ! -f "$PWD/venv/bin/activate" ]]; then
        deactivate 2>/dev/null
    fi
}
chpwd_functions+=(auto_venv)

# --------- VI MODE ---------
bindkey -v
export KEYTIMEOUT=1
zle-keymap-select() {
    if [[ $KEYMAP == vicmd ]] || [[ $KEYMAP == vi-command ]]; then
        echo -ne "\033]12;#ff5555\007" # Red cursor in normal mode
    else
        echo -ne "\033]12;#50fa7b\007" # Green cursor in insert mode
    fi
}
zle -N zle-keymap-select
zle-line-init() { zle-keymap-select }
zle -N zle-line-init

# --------- LS COLORS ---------
if command -v dircolors &>/dev/null; then
    eval "$(dircolors -b)"
fi
echo -ne '\033]12;#FFFFFF\a'
export PATH="$HOME/.local/bin:$PATH"
