# exports
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR='vim'

export SCALA_HOME=/usr/bin/scala
export RUBY_HOME=/usr/local/Cellar/ruby/1.9.3-p194
export RVM_HOME=$HOME/.rvm
export JSC_HOME=/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$RUBY_HOME/bin:$RVM_HOME/bin:$SCALA_HOME/bin:$JSC_HOME:$PATH

export PS1='\[\033[1;37m\]\u\[\033[0m\]:\[\033[1;33m\]\w\[\033[0m\]\[\033[1;32m\]$(__git_ps1)\[\033[0m\]\[\033[1;37m\]$\[\033[0m\] '

# Git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add tab completion for `defaults read|write NSGlobalDomain`
# # You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# sources
source ~/.aliases

#Git ignore files
function gi() { curl http://gitignore.io/api/$@ ;}
