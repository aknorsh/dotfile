# dotfile
```sh
git clone --recursive https://github.com/aknorsh/dotfile.git ~/.dotfile
```

## Dependencies
```sh
brew install stow neovim
```

## How to apply
```sh
make check
make install
```

### Notes

##### vim
```sh
# カラースキーマ用のディレクトリを設置
mkdir -p ~/.vim/colors
```
- vimrcを使う場合は [dein.vim](https://github.com/Shougo/dein.vim) のセットアップをする
    - https://github.com/Shougo/dein.vim#quick-start
