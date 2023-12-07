rg() {
  if [ -z "$@" ]; then
    echo "Usage: mygrep <pattern>"
    return 1
  fi

  grep -R $@ .
}
