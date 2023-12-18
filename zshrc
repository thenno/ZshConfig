ZDOTDIR=$HOME/.zsh.d

HISTCONTROL=ignoreboth:erasedups
HISTFILE=$ZDOTDIR/zsh_history

export ZSH_CACHE_DIR=$ZDOTDIR/cache

setopt CORRECT_ALL
setopt auto_cd


export LANG=en_US.UTF-8

for lib_file ("$ZDOTDIR"/lib/*.zsh); do
  source $lib_file
done
unset lib_file

fpath+=$ZDOTDIR/completions

ZSH_THEME="ys-thenno"
autoload -U colors && colors
setopt prompt_subst
export LSCOLORS="Gxfxcxdxbxegedabagacad"
source "$ZDOTDIR/themes/$ZSH_THEME.zsh-theme"

ZSH_PLUGINS="$ZDOTDIR/plugins"
plugins=(zsh-autosuggestions rg)

for plugin ($plugins); do
  load_plugin $ZSH_PLUGINS $plugin
done
unset plugin

if [ -d "$HOME/bin" ] ; then
  export PATH=$PATH:$HOME/bin
fi

source $ZDOTDIR/zsh.aliases

CONFIGHOST="$HOME/.zsh.d/hosts/`hostname`"
if [ -d $CONFIGHOST ] ; then
  [ -f $CONFIGHOST/zshrc ] && source $CONFIGHOST/zshrc
  [ -f $CONFIGHOST/zsh.aliases ] && source $CONFIGHOST/zsh.aliases
fi
unset CONFIGHOST

compinit -d $ZSH_COMPDUMP
