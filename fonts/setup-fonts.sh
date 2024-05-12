#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0")"

setup_fonts() {
  cp $SCRIPT_DIR/*.otf $HOME/Library/Fonts/
}

setup_fonts
