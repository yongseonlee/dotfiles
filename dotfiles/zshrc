export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git wd alias-tips)
source $ZSH/oh-my-zsh.sh

export VIRTUAL_ENV_DISABLE_PROMPT=1
PROMPT='$(git_prompt_info)$(_curr_venv)$(_curr_python)$(_curr_k8s)
%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} '

function _curr_venv() {
  # Only show venv if VIRTUAL_ENV is set (actual virtual environment)
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "$(_decor venv 228 $(basename $(echo $VIRTUAL_ENV | sed -e "s/\/venv//g")))"
  fi
}

function _curr_python() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    version=$(python --version 2>&1)
    echo "$(_decor python 228 $(echo $version | sed -e "s/Python //g"))"
  fi
}

function _curr_k8s() {
  if command -v kubectl >/dev/null 2>&1; then
    context=$(kubectl config current-context 2>/dev/null)
    if [[ -n "$context" ]]; then
      echo "$(_decor k8s 228 $context)"
    fi
  fi
}

function _decor() {
  if [[ ! -z $3 ]]; then
    echo "%B%F{252}$1:(%f%F{$2}$3%f%F{252})%f%b "
  fi
}

# cdf - cd into the directory of the selected file
cdf() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

gch() {
    git checkout "$(git branch | fzf | tr -d '[:space:]')" 2>/dev/null || true
}

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(mise activate zsh)"

alias tf="terraform"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export TERRAFORM_CONFIG=$HOME/.terraform.d/credentials.tfrc.json

export PATH="/opt/homebrew/bin:$GOBIN:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/opt/homebrew/opt/postgresql@17/bin:/Users/ys/Library/pnpm:$PATH"

