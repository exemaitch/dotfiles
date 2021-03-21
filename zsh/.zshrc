# .bashrc

for file in ~/dotfiles/local/.{path,bash_prompt,exports,aliases,functions,extra,git-completion.bash}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;


# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi
