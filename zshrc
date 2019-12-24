# Path to your oh-my-zsh configuration.
ZDOTDIR=$HOME/.zsh.d
ZSH=$ZDOTDIR/oh-my-zsh
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

PYTHONPATH="./.pip:$PYTHONPATH"

HISTCONTROL=ignoreboth:erasedups
HISTFILE=$ZDOTDIR/zsh_history

autoload -U compinit
compinit
setopt CORRECT_ALL

ZSH_THEME="ys"

if [[ $TERM == "xterm" || $TERM == "screen" ]]
then
	export TERM="xterm-256color"
fi

export HOMEBREW_NO_EMOJI=True
export LSCOLORS="Dxfxcxdxcxegedabagacad"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/zsh.aliases

if [ ! -d "$HOME/bin" ] ; then
    mkdir -p $HOME/bin
fi
if [ ! -d "$HOME/.pip" ] ; then
    mkdir -p $HOME/.pip
fi

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/.local/bin:~/bin

if [ -d "$HOME/.virtualenvs" ] ; then
	export WORKON_HOME=$HOME/.virtualenvs
	source /usr/local/bin/virtualenvwrapper.sh
fi

CONFIGHOST="$HOME/.zsh.d/`hostname`"
if [ -d $CONFIGHOST ] ; then
	[ -f $CONFIGHOST/zshrc ] && source $HOME/.zsh.d/`hostname`/zshrc
	[ -f $CONFIGHOST/zsh.aliases ] && source $HOME/.zsh.d/`hostname`/zsh.aliases
fi

export LANG=en_US.UTF-8
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

export REQUESTS_CA_BUNDLE=/Users/thenno/.certs/ca-certificates.crt

eval $(thefuck --alias)
