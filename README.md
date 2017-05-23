# dotfiles

This repo is heavily inspired by:
   * https://github.com/mathiasbynens/dotfiles
   * https://github.com/thoughtbot/dotfiles

On OS X, install brew like so:
brew install --build-from-source  vim

We need the +conceal option for jedi-vim to work.

Also, make sure that vim has been compiled with python2 support so vim-jedi 
will work properly.  To get autocompletion to work with vim-jedi, you 
must use same version of python that vim is compiled with.

For local gitconfig, add .gitconfig.local to your home directory.
Put stuff like git secrets in there (for aws).
