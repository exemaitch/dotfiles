# dotfiles

This repo is heavily inspired by:
   * https://github.com/mathiasbynens/dotfiles
   * https://github.com/thoughtbot/dotfiles

## To use the dotfiles in this repo
1. Install stow with Homebrew
```
brew install stow
```

1. Checkout the repo into $HOME
2. In the directory of the dotfiles, use stow to symlink the files in the subdirectories of your choice into $HOME
```
cd $HOME/dotfiles
stow zsh
stow tmux
```