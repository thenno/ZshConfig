#autoload

rg() {
  if [[ -z "$@" ]]; then
    echo "Usage: rg <pattern>"
    return 1
  fi

  \grep -G --color=auto -R --exclude-dir={build,.git,.idea,.tox,.venv,.tools_venv,.ruff_cache,.mypy_cache,\*proto_stubs,__pycache__,\*.egg-info,.pytest_cache,build,dist} --exclude={\*.pyc} $@ .
}
