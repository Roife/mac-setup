# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$PATH:~/.local/bin

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search zsh-syntax-highlighting colored-man-pages zsh-autosuggestions extract wd)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


mkd(){
    mkdir $1 && cd $1
}

# for Compile
compileC(){
    g++ -o ${file%.*} -Wall -lstdc++ -g
}

compileHaskell(){
    stack ghc -- $1 -o ${file%.*}
}

run(){
    file=$1
    if [ ! -f "$file" ]; then
        print "run: $file : no such file"
        return
    fi
    case "${file##*.}" in
        "cpp" | "c")
            compileC $1
            if [ $? -eq 0 ];
            then
                ./${file%.*}
            fi
            ;;
        "hs" )
            compileHaskell $1
    esac
}

#tree(){
#    find $1 -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
#}

export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;

export GITHUB=~/Documents/github
backup(){
    cp ~/.gitconfig ~/.gitignore ~/.tmux.conf ~/.vimrc  ~/.zshrc $GITHUB/mac-setup
    #cp -rf ~/.bin $GITHUB/mac-setup
    cp -rf ~/.vim/template $GITHUB/mac-setup/
}

weather() {
    curl http://wttr.in/$1
}

alias vi='vim'
alias m='wd'
alias -s cpp='vim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
