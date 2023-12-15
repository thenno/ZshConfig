ZDOTDIR=$HOME/.zsh.d

HISTCONTROL=ignoreboth:erasedups
HISTFILE=$ZDOTDIR/zsh_history

export ZSH_CACHE_DIR=$ZDOTDIR/cache
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

setopt CORRECT_ALL
setopt auto_cd


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
  source $lib_file
done
unset lib_file

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

zstyle ':completion:*' menu select
autoload -Uz compinit
compinit -d $ZSH_COMPDUMP

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search