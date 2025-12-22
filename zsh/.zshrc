alias python=/usr/bin/python3
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# git-prompt 拡張 https://github.com/woefe/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/examples/rprompt.zsh

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function ghq-fzf() {
	local selected_dir=$(ghq list | fzf --query="$LBUFFER")

	if [ -n "$selected_dir" ]; then
		BUFFER="cd $(ghq root)/${selected_dir}"
		zle accept-line
	fi

	zle reset-prompt
}
zle -N ghq-fzf
bindkey "^]" ghq-fzf
export GHQ_ROOT=~/github.com

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

alias lg=lazygit
alias gc="git checkout"
export LANG=en_US.UTF-8

# Antigravity
export PATH="~/.antigravity/antigravity/bin:$PATH"

source ~/.zshrc.local
