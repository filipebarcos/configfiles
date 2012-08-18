# exports
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"

# Git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

# sources
source ~/.aliases
source ~/.colors