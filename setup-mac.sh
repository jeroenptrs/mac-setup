#!/usr/bin/env zsh

# Inspiration - General script
#
# - https://gist.github.com/codeinthehole/26b37efa67041e1307db
# - https://www.lotharschulz.info/2021/05/11/macos-setup-automation-with-homebrew/

ROOT_DIR="$(dirname "$0")"
source "$ROOT_DIR/utils.sh"

sudo -v # Ask for the administrator password upfront

print_header "Setting up OSX preferences 🖥"
source "$ROOT_DIR/osx/setup-osx.sh"
require_password_on_sleep
setup_typing_preferences
setup_finder
enable_snap_to_grid
expand_save_and_print_dialogs
setup_dock
setup_mission_control

killall Finder
killall Dock
print_footer "OSX preferences set up"


print_header "Creating folders 📂"
safe_create_folder $HOME/Projects/Personal
safe_create_folder $HOME/Projects/Work
print_footer "Folders created"


print_header "Installing HomeBrew 🍺"
source "$ROOT_DIR/homebrew/setup-homebrew.sh"
install_homebrew
print_footer "HomeBrew installed"

print_header "Downloading HomeBrew apps 📱"
download_homebrew_apps
print_footer "HomeBrew apps downloaded"

print_header "Setting up NVM 📦"
source "$ROOT_DIR/nvm/setup-nvm.sh"
setup_nvm
print_footer "NVM set up"

print_header "Setting up shell 🐚"
source "$ROOT_DIR/shell/setup-shell.sh"
setup_shell
print_footer "Shell set up"

print_header "Setting up Mac Apps 🐚"
source "$ROOT_DIR/mas/setup-apps.sh"
setup_apps
print_footer "Mac apps set up"

print_header "Setting up warp 🌊"
source "$ROOT_DIR/warp/setup-warp.sh"
setup_warp
print_footer "Warp set up"

print_header "Syncing VSCode settings ⚙️"
source "$ROOT_DIR/vscode/setup-vscode.sh"
sync_vscode_settings
print_footer "VSCode settings synced"

print_header "Setting up fonts 🐚"
source "$ROOT_DIR/fonts/setup-fonts.sh"
setup_fonts
print_footer "Fonts set up"