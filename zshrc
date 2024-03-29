export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wd)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

alias tf="terraform"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=/opt/homebrew/bin:$GOBIN:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH
export TERRAFORM_CONFIG=$HOME/.terraform.d/credentials.tfrc.json
export VIRTUAL_ENV_DISABLE_PROMPT=1
PROMPT='$(git_prompt_info)$(_curr_venv)$(_curr_python)$(_curr_tf)
%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} '

function _curr_tf() {
  if [[ -d .terraform ]]; then
    tf=$(cat .terraform/environment 2>/dev/null || print 'none')
    echo "$(_decor tf 228 $tf)"
  fi
}

function _curr_venv() {
  venv_name=$(basename $(which python | sed -e "s/\/bin\/python//g"))
  
  if [[ "venv" == $venv_name ]]; then
      echo "$(_decor venv 228 $(basename $(which python | sed -e "s/\/venv\/bin\/python//g")))"
  elif [[ "usr" != $venv_name && "local" != $venv_name && "python" != $venv_name && "homebrew" != $venv_name ]]; then
      echo "$(_decor venv 228 $venv_name)"
  fi

}

function _curr_python() {
  version=$(python --version 2>&1)
  echo "$(_decor python 228 $(echo $version | sed -e "s/Python //g"))"
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

# pyenv
eval "$(pyenv init -)"

