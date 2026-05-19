alias q='exit'
alias :q='exit'
alias gt='git log --oneline --graph --decorate --parents'
alias cat='bat'
alias db='nvim -c "DBUI"'
alias dbox='distrobox'
alias nnvim='SKIP_LAZY_CHECK=1 nvim'
alias nv='nvim'
alias yaegi='rlwrap yaegi'
alias h=hyprland
alias lg=lazygit
alias hx=helix
alias watts="awk '{print \$1*10^-6 \"W\"}' /sys/class/power_supply/BAT0/power_now"

    
export BAT_THEME=1337
# export BAT_THEME="ansi"

# export BAT_THEME="Visual Studio Dark+"

# stop the percent sign from showing up
export PROMPT_EOL_MARK=''

# enable my bins
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.config/bin:$PATH"
# go
export PATH="$HOME/go/bin:$PATH"
# rust
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# allow local ./bin
export PATH="./bin:$PATH"

# nvim
export EDITOR='nvim'
export VISUAL='nvim'

# Elixir Stuff
export ERL_AFLAGS="-kernel shell_history enabled"
# Elixir Stuff End

# direnv
eval "$(direnv hook zsh)"

##### FZF #####
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# shell integration allows ^r to use fzf for reverse search
source <(fzf --zsh)
# bindkey -M viins '^p' fzf-history-widget
##### End FZF #####

# put lazygit config (and others?) in the right place
export XDG_CONFIG_HOME="$HOME/.config"

# add new line between commands because starship puts one at
# before the first prompt if you turn it's feature on
precmd() { precmd() { echo } }
eval "$(starship init zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
####### ZSH PLUGINS #######

zi light z-shell/zsh-lsd

# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# zsh completions
zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit

# zsh auto suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=239'
zinit light zsh-users/zsh-autosuggestions
# bindkey '^y' autosuggest-accept # accept
bindkey -rp "^Y"
bindkey '\x19' autosuggest-accept
bindkey -M viins '\x19' autosuggest-accept

# bindkey '^ ' autosuggest-execute # accept and execute
# bindkey '^ ' autosuggest-clear # clear
# bindkey '^ ' autosuggest-fetch # Fetches a suggestion (works even when suggestions are disabled).
# bindkey '^ ' autosuggest-disable
# bindkey '^ ' autosuggest-enable
# bindkey '^ ' autosuggest-toggle # toggle between disable and enable
# bindkey -M vicmd 'k' history-search-backward
# bindkey -M vicmd 'j' history-search-forward
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}' # Maybe only works correctly on linux?

# Change cursor shape for different vi modes.
function zle-keymap-select () {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q';; # block
    viins|main) echo -ne '\e[5 q';; # beam
  esac
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
  echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# End Change cursor shape for different vi modes.

# Yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Lazydocker
# make sure to: systemctl --user enable --now podman.socket
export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock
alias docker='podman'

# set the title in the title bar/tab bar
function stitle() {
  echo -en "\e]2;$@\a"
}

# version manager
eval "$(mise activate)"

# source /home/bryan/.config/broot/launcher/bash/br

eval "$(atuin init zsh)"
bindkey -M viins '^p' atuin-search-viins
bindkey -M vicmd '^J' atuin-accept
bindkey -M vicmd 'k' atuin-search-vicmd

# zsh syntax highlighting (must be at end of file)
zinit light zsh-users/zsh-syntax-highlighting

