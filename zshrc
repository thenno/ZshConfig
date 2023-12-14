# Path to your oh-my-zsh configuration.
ZDOTDIR=$HOME/.zsh.d

PYTHONPATH="./.pip:$PYTHONPATH"

HISTCONTROL=ignoreboth:erasedups
HISTFILE=$ZDOTDIR/zsh_history
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

DISABLE_AUTO_UPDATE="true"
ZSH=$ZDOTDIR/ohmyzsh

# Set ZSH_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM="$ZDOTDIR/custom"
fi

setopt CORRECT_ALL

ZSH_THEME="ys-thenno"

export LSCOLORS="Dxfxcxdxcxegedabagacad"

plugins=(zsh-autosuggestions rg)

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/zsh.aliases

if [ ! -d "$HOME/bin" ] ; then
    mkdir -p $HOME/bin
fi
export PATH=$PATH:$HOME/bin

if [ ! -d "$HOME/.pip" ] ; then
    mkdir -p $HOME/.pip
fi

export LANG=en_US.UTF-8

CONFIGHOST="$HOME/.zsh.d/hosts/`hostname`"
if [ -d $CONFIGHOST ] ; then
	[ -f $CONFIGHOST/zshrc ] && source $CONFIGHOST/zshrc
	[ -f $CONFIGHOST/zsh.aliases ] && source $CONFIGHOST/zsh.aliases
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
