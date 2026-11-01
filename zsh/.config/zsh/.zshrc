# 最初に本来の .zshrc を読む
[[ -r ~/.zshrc ]] && source ~/.zshrc

alias python=/usr/bin/python3
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# asdf (git 版 → なければ brew 版)
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
  [ -f "$HOME/.asdf/completions/asdf.bash" ] && . "$HOME/.asdf/completions/asdf.bash"
elif command -v brew >/dev/null 2>&1 && [ -f "$(brew --prefix asdf 2>/dev/null)/libexec/asdf.sh" ]; then
  . "$(brew --prefix asdf)/libexec/asdf.sh"
fi

# mise
command -v mise >/dev/null 2>&1 && eval "$(mise activate zsh)"

# git-prompt 拡張 https://github.com/woefe/git-prompt.zsh
source ~/.config/zsh/git-prompt.zsh/git-prompt.zsh
source ~/.config/zsh/git-prompt.zsh/examples/rprompt.zsh

# direnv
command -v direnv > /dev/null 2>&1 && eval "$(direnv hook zsh)"

# fzf
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

alias lg=lazygit
alias gc="git checkout"
export LANG=en_US.UTF-8

# Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
