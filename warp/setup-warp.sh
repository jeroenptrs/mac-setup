#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0")"

setup_warp() {
    THEME_DARK_SAKURA="dark sakura"
    copy_theme $THEME_DARK_SAKURA
}

copy_theme() {
    THEMES_DIR="$HOME/.warp/themes"
    theme_name=$1
    cp "$SCRIPT_DIR/$theme_name.jpeg" "$THEMES_DIR/$theme_name.jpeg"
    cp "$SCRIPT_DIR/$theme_name.yaml" "$THEMES_DIR/$theme_name.yaml"
}
