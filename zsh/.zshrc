PS1='%F{green}%n%f@%F{red}%m%f %1~ %F{white}$%f '
export ZDOTDIR=$HOME/.config/zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.local/share/zsh/history
HISTSIZE=1000
SAVEHIST=10000
alias hg="history 1 | grep"
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lizzy/.zshrc'

autoload -U compinit
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

set autocd extendedglob nomatchmenucomplete



zstyle ':completion:*' menu select
zmodload zsh/complist
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

export PATH=/home/lizzy/.local/bin:$PATH:/home/lizzy/.cargo/bin
export EDITOR=nvim

#source ~/Downloads/Git/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Starts smart cd
eval "$(zoxide init --cmd cd zsh)"

alias vim='nvim'
alias vi='nvim'
alias v='nvim'

alias rc="cd ~/.config/nvim"
alias ca="cp ~/Documents/latex/art_template.tex"
alias th="cd ~/Documents/theory/"
alias za="zathura --fork 2>/dev/null"
alias bib="nvim ~/Documents/theory/sources.bib"
alias con="xrandr --output HDMI-1 --auto --same-as eDP-1"
alias conr="xrandr --output HDMI-1 --auto --right-of eDP-1"
alias conl="xrandr --output HDMI-1 --auto --left-of eDP-1"
alias conn="xrandr --output DP-1 --auto --right-of eDP-1"

alias s="cd ~/Documents/skool/Spring2024"
alias thesis="cd ~/Documents/skool/thesis/; source ~/Documents/skool/thesis/thesis/bin/activate"
alias vtpres="cd ~/Documents/skool/thesis/presentations/; nvim ."
alias edu="sudo nmcli device wifi connect eduroam"
alias rlog="ssh d4n1elp@rlogin.cs.vt.edu"
alias gspan="TERM=xterm ssh d4n1elp@gspan.cs.vt.edu"
alias rambo="TERM=xterm ssh d4n1elp@rambo.cs.vt.edu"
alias gans="TERM=xterm ssh d4n1elp@gans.cs.vt.edu"

alias doc="sudo systemctl start docker"
alias doc_ai="docker start -i tf"

alias music="ncmpcpp"
alias party_parrot="curl parrot.live"

#alias cd="z"
alias cat="bat"
alias ls="lsd"
alias lst="ls -t | head"
alias llama="npx dalai serve"

alias cv_update="cp ~/Documents/resume/cv.pdf ~/Documents/personal_website/static/files/cv.pdf"

source "$ZDOTDIR/zsh-functions"

#zstyle ':completion:*' matcher-list 'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
#zsh_add_plugin "zsh-users/zsh-autosuggestions"
#zsh_add_plugin "ericfreese/zsh-cwd-history"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
#zsh_add_plugin "hlissner/zsh-autopair"
#bindkey '`' autosuggest-execute
#ZSH_AUTOSUGGEST_STRATEGY=(completion history)
#ZSH_CWD_HISTORY_DIR="~/.config/zsh/zsh_cwd_history"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:~/.local/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

zstyle ':completion:*:*:nvim:*' file-patterns '^*.(aux|log|pdf|run.xml):source-files' '*:all-files'
