# dotfile
```sh
git clone --recursive https://github.com/aknorsh/dotfile.git ~/github.com/aknorsh/dotfile
```

## Dependencies
```sh
brew install stow neovim tmux herdr
```

## How to apply
```sh
make check
make install
```

`make install` で `zsh` `tmux` `herdr` `nvim` `vim` を stow でホームに展開する(`.stowrc` により `~` 直下へ個別ファイルをリンク)。
既存の実ファイルがあると stow が失敗するので、先にリポジトリ側へ移すか退避しておく。

### Notes

##### vim
```sh
# カラースキーマ用のディレクトリを設置
mkdir -p ~/.vim/colors
```
- vimrcを使う場合は [dein.vim](https://github.com/Shougo/dein.vim) のセットアップをする
    - https://github.com/Shougo/dein.vim#quick-start
