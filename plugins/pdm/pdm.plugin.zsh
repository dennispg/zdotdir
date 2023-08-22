if (( ! $+commands[pdm] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `pdm`. Otherwise, compinit will have already done that.
COMPLETIONS_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completions
mkdir -p $COMPLETIONS_DIR
if [[ ! -f "$COMPLETIONS_DIR/_pdm" ]]; then
  pdm completion zsh >| "$COMPLETIONS_DIR/_pdm" &|
  typeset -g -A _comps
  autoload -Uz _pdm
  _comps[pdm]=_pdm
fi

