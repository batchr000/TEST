# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cupp=' python36 /opt/cupp/cupp.py  -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
