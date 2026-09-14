export DOTFILES="${${(%):-%N}:A:h:h}"
[[ -d $DOTFILES/.git ]] || { print -u2 "warning: DOTFILES=$DOTFILES"; unset DOTFILES; }

# .zshrc root を ~/.config/zsh に移動
export ZDOTDIR=$HOME/.config/zsh
[[ -r ~/.config/dotfiles.env ]] && source ~/.config/dotfiles.env
