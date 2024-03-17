#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0")"

install_homebrew() {
  # https://brew.sh/
  which -s brew
  if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/jeroen/.zprofile;
    eval "$(/opt/homebrew/bin/brew shellenv)";
  fi
  brew update;
  brew upgrade;
}

download_homebrew_apps() {
  # Install any Homebrew packages, Mac Apps or VSCode extensions using a Brewfile
  # https://docs.brew.sh/Manpage#bundle-subcommand
  # https://github.com/Homebrew/homebrew-bundle
  brew bundle --file="$SCRIPT_DIR/Brewfile"
}
