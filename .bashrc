# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# INSERTED BY VME5 INSTALLER
if [ -f /opt/ardendo-install/vme/env ]; then
   source /opt/ardendo-install/vme/env
elif [ -f /var/ardendo/installer/env ]; then
   source /var/ardendo/installer/env
fi
