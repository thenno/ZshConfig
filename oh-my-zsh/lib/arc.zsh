function parse_arc_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--short')

  STATUS=$(command arc status ${FLAGS} | head -n1)

  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_ARC_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_ARC_PROMPT_CLEAN"
  fi
}

function arc_prompt_info() {
  (( $+commands[arc] )) || return

  local ref mode

  $(arc root >/dev/null 2>&1)
  if [[ $? -eq 0 ]]; then
    arc_status=$(arc status)
    arc_status_first_line=${arc_status%%$'\n'*}
    ref="$arc_status_first_line"

    if [[ "$ref" == "On branch "* ]]; then
      ref=${ref/"On branch "/"refs/heads/"}
    else
      if [[ "$ref" == "HEAD detached"* ]]; then
        ref=${ref/"HEAD detached at "/}
      elif [[ "$ref" == "rebase in progress"* ]]; then
        ref=${ref/"rebase in progress; onto "/""}
      fi
    fi

    echo "$ZSH_THEME_ARC_PROMPT_PREFIX${ref#refs/heads/}$(parse_arc_dirty)$ZSH_THEME_ARC_PROMPT_SUFFIX"
  fi
}
