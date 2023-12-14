#autoload

rg() {
  if [ -z "$@" ]; then
    echo "Usage: rg <pattern>"
    return 1
  fi

  \grep --color=auto -R $@ .
}
