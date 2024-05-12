#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0")"

setup_fonts() {
  open -b com.apple.FontBook "$SCRIPT_DIR/CommitMono-400-Regular.otf"  
  open -b com.apple.FontBook "$SCRIPT_DIR/CommitMono-400-Italic.otf"  
  open -b com.apple.FontBook "$SCRIPT_DIR/CommitMono-700-Regular.otf"  
  open -b com.apple.FontBook "$SCRIPT_DIR/CommitMono-700-Italic.otf"  
}

setup_fonts