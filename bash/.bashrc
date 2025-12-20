# git
source $HOME/.dotfile/bash/git-prompt.sh
source $HOME/.dotfile/bash/git-completion.bash
## プロンプトに git 表示
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

export TERM=xterm-256color

# aliases
alias gc="git checkout"
alias lg=lazygit
