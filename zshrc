# Path to your oh-my-zsh configuration.
load_plugin() {
  local base_path=$1
  local plugin="$2"

  local plugin_directory="$base_path/$plugin"

  if [[ -d "$plugin_directory" && -f "$plugin_directory/$plugin.plugin.zsh" ]]; then
    source "$plugin_directory/$plugin.plugin.zsh"
  else
    echo "Error: Invalid or missing plugin directory for $plugin: $plugin_directory"
  fi
}


ZDOTDIR=$HOME/.zsh.d

HISTCONTROL=ignoreboth:erasedups
HISTFILE=$ZDOTDIR/zsh_history

export ZSH_CACHE_DIR=$ZDOTDIR/cache
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

setopt CORRECT_ALL

<<<<<<< HEAD
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

=======
>>>>>>> a3625a6 (First step)
export LANG=en_US.UTF-8

for lib_file ("$ZDOTDIR"/lib/*.zsh); do
  source "$ZDOTDIR"/lib/*.zsh
done
unset lib_file

ZSH_PLUGINS="$ZDOTDIR/plugins"
ZSH_THEME="ys-thenno"
plugins=(zsh-autosuggestions rg)

source "$ZDOTDIR/themes/$ZSH_THEME.zsh-theme"

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
