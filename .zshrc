# auto-completion
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -U compinit
compinit

# auto-cd
setopt autocd

# PS
autoload -U colors && colors
PS1="%{$fg[blue]%}# %{$fg[yellow]%}%~
%{$fg[red]%}$%{$reset_color%} "

# highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# alias
alias l='ls -laG'
alias grep='grep --color'
alias ec='emacsclient'

#alias-git
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gst='git status'
alias gr='git reset --HARD'
