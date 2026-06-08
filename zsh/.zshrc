autoload -Uz compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_CD

alias ls='eza --icons'
alias ll='eza -lah --icons'
alias la='eza -A --icons'
alias tree='eza --tree --icons'

alias gs='git status'
alias v='nvim'
alias c='clear'

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fastfetch
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dotfiles/scripts:$PATH"
export PATH="$HOME/dotfiles/wallpaper-system/scripts:$PATH"
# Load Caelestia terminal colors on startup
function yy() {                          
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd "$cwd"
    fi
    rm -f "$tmp"
}

if [ -f "$HOME/.local/state/caelestia/sequences.txt" ]; then
    cat "$HOME/.local/state/caelestia/sequences.txt"
fi
export EDITOR=nvim
export VISUAL=nvim
