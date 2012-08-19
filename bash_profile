# exports
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

export PS1='\n[\u] \[\033[1;33m\]\w\[\033[0m\] \[\033[1;32m\]$(__git_ps1)\[\033[0m\] \n\$ '

# Git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

# sources
source ~/.aliases