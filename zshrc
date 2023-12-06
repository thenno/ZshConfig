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

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

CONFIGHOST="$HOME/.zsh.d/`hostname`"
if [ -d $CONFIGHOST ] ; then
	[ -f $CONFIGHOST/zshrc ] && source $HOME/.zsh.d/`hostname`/zshrc
	[ -f $CONFIGHOST/zsh.aliases ] && source $HOME/.zsh.d/`hostname`/zsh.aliases
fi

export LANG=en_US.UTF-8

alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS

export PATH="/opt/homebrew/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
