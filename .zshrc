###############################################
# ZSH setup
###############################################

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete)
source $ZSH/oh-my-zsh.sh

###############################################
# Aliases
###############################################

alias cdp="cd $HOME/personal"
alias cdpc="cd $HOME/personal/code"

alias cdw="cd $HOME/work"
alias cdwc="cd $HOME/work/code"

alias cdm="cd $HOME/work/code/twipe-app-v4"

alias cdroot="cd ~"
alias cdhome="cd /"

alias git-rst="git clean -df && git checkout -- ."
alias git-find-tag="git rev-list -n 1"
alias git-prune="git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done"

###############################################
# React Native Android Studio setup https://reactnative-archive-august-2023.netlify.app/docs/next/environment-setup?package-manager=yarn&guide=native&platform=android
###############################################

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

###############################################
# rbenv 
###############################################

eval "$(rbenv init - zsh)"

###############################################
# nvm 
###############################################

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###############################################
# nvm deeper shell integration https://github.com/nvm-sh/nvm?tab=readme-ov-file#deeper-shell-integration
###############################################

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

###############################################
# Starship prompt https://starship.rs/
###############################################

eval "$(starship init zsh)"