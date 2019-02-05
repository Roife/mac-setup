# auto-completion
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}" # colors for ls
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # case-insensitive when completion with tab
autoload -U compinit
compinit

# cd folder without "cd"
setopt autocd

# highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# auto-suggestion
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# z
source /usr/local/etc/profile.d/z.sh

# PS
PS1="%F{135}%n%f@%F{166}%m%f %F{118}%~%f %# "

# history
HISTFILE=~/.histfile
HISTSIZE=200
SAVEHIST=200
setopt appendhistory

# alias
alias l='ls -laG'
alias grep='grep --color'
alias ec='emacsclient -n'

#alias-git
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gst='git status'
alias gr='git reset --HARD'
alias gd='git diff'
