# Path to your oh-my-zsh configuration.
ZDOTDIR=$HOME/.zsh.d
ZSH=$ZDOTDIR/oh-my-zsh
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

HISTCONTROL=ignoreboth:erasedups
HISTFILE=$ZDOTDIR/zsh_history

autoload -U compinit
compinit
setopt CORRECT_ALL

ZSH_THEME="thenno"
if [[ $TERM == "dumb" ]]
then
	set $ZSH_THEME = "thenno_clean"
fi
if [[ $TERM == "xterm" ]]
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

export LANG=en_US.UTF-8

if [ ! -d "$HOME/bin" ] ; then
    mkdir -p $HOME/bin
fi
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/bin

if [ -d "$HOME/.virtualenvs" ] ; then
	export WORKON_HOME=$HOME/.virtualenvs
	source /usr/local/bin/virtualenvwrapper.sh
fi

CONFIGHOST="$HOME/.zsh.d/`hostname`"
if [ -d $CONFIGHOST ] ; then
	[ -f $CONFIGHOST/zshrc ] && source $HOME/.zsh.d/`hostname`/zshrc
	[ -f $CONFIGHOST/zsh.aliases ] && source $HOME/.zsh.d/`hostname`/zsh.aliases
fi
