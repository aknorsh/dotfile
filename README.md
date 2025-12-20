# dotfile
```sh
git clone --recursive https://github.com/aknorsh/dotfile.git ~/.dotfile
```

## Dependencies
```sh
brew install stow
```

## How to apply
```sh
# nvim の例
stow -v -t ~ nvim zsh
```

### Notes

##### vim
```sh
# カラースキーマ用のディレクトリを設置
mkdir -p ~/.vim/colors
```
- vimrcを使う場合は [dein.vim](https://github.com/Shougo/dein.vim) のセットアップをする
    - https://github.com/Shougo/dein.vim#quick-start
