#!/usr/bin/env bash
set -e

[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Ask for the administrator password upfront
sudo -v

# Keep sudo privileges alive during script lifetime
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Homebrew                                                                    *
###############################################################################

if ! hash brew &> /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
fi

brew update
brew upgrade

if ! brew cask &> /dev/null; then
  brew tap phinze/homebrew-cask 2> /dev/null
  brew install brew-cask 2> /dev/null
fi

brew tap caskroom/versions

brew install \
     ansible \
     ccat \
     cloc \
     coreutils \
     direnv \
     fasd \
     git \
     git-extras \
     go \
     gpg \
     imagemagick --with-webp \
     mas \
     moreutils \
     neovim/neovim/neovim \
     python3 \
     reattach-to-user-namespace \
     rename \
     the_silver_searcher \
     tldr \
     tmux \
     tree \
     watch \
     wget \
     zsh

brew cask install \
     docker \
     flux \
     google-chrome \
     google-drive \
     gpgtools \
     iterm2-nightly \
     keepingyouawake \
     lastpass \
     spotify \
     ubersicht \
     vagrant \
     veracrypt \
     ubersicht \
     unetbootin \
     virtualbox \
     visual-studio-code

brew cleanup

mas install \
    `# Deliveries` 924726344 \
    `# Fantastical 2` 975937182 \
    `# Keynote` 409183694 \
    `# Magnet` 441258766 \
    `# Numbers` 409203825 \
    `# OmniFocus` 867299399 \
    `# OmniGraffle` 711830901 \
    `# Pages` 409201541 \
    `# Quiver` 866773894 \
    `# StreamCloud` 894578573 \
    `# Tweetbot` 557168941 \
    `# Xcode` 497799835

###############################################################################
# Node.js                                                                     #
###############################################################################

if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.3/install.sh | bash
fi

###############################################################################
# Übersicht                                                                   #
###############################################################################

ln -sf "$HOME/dotfiles/init/files/Übersicht" "$HOME/Library/Application Support/"

###############################################################################
# Visual Studio Code                                                          #
###############################################################################

if [[ ! -d "$HOME/Library/Application Support/Code/User" ]]; then
  mkdir -p "$HOME/Library/Application Support/Code/User"
fi

VSCODE_CONFIGS=(
  keybindings
  settings
)

for file in ${VSCODE_CONFIGS[@]}; do
  ln -sf \
    "$HOME/dotfiles/init/files/Visual Studio Code/User/$file.json" \
    "$HOME/Library/Application Support/Code/User"
done

VSCODE_EXTENSIONS=(
  PeterJausovec.vscode-docker
  aeschli.vscode-css-formatter
  alefragnani.project-manager
  clinyong.vscode-css-modules
  dbaeumer.vscode-eslint
  dracula-theme.theme-dracula
  eg2.tslint
  fallenwood.vimL
  gamunu.vscode-yarn
  lukehoban.Go
  minhthai.vscode-todo-parser
  robertohuertasm.vscode-icons
  shinnn.stylelint
  stkb.rewrap
  vscodevim.vim
)

for EXTENSION in ${VSCODE_EXTENSIONS[@]}; do
  code --install-extension $EXTENSION
done

###############################################################################
# General                                                                     #
###############################################################################

# Install fonts
cp "$HOME/dotfiles/init/fonts/"* "$HOME/Library/Fonts"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

###############################################################################
# UI                                                                          #
###############################################################################

# Use dark menu bar and Dock
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults write NSGlobalDomain AppleInterfaceTheme -string "Dark"

###############################################################################
# Input                                                                       #
###############################################################################

# Disable Control+Left and Control+Right from switching spaces
set_hotkey() {
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$1" "$2"
}

set_hotkey 79 "{ enabled = 0; value = { parameters = (65535, 123, 8650752); type = standard; }; }"
set_hotkey 80 "{ enabled = 0; value = { parameters = (65535, 123, 8781824); type = standard; }; }"
set_hotkey 81 "{ enabled = 0; value = { parameters = (65535, 124, 8650752); type = standard; }; }"
set_hotkey 82 "{ enabled = 0; value = { parameters = (65535, 124, 8781824); type = standard; }; }"

# Disable press-and-hold and just repeat key presses
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a very fast key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1

# Remove text shortcuts
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array

# Disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Disable automatic word capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Enable Tab focus for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

###############################################################################
# Screen                                                                      #
###############################################################################

# Set desired wallpaper
sqlite3 "$HOME/Library/Application Support/Dock/desktoppicture.db" \
  "update data set value = '/Library/Desktop Pictures/Sierra 2.jpg'";

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Hide all Desktop icons
defaults write com.apple.finder CreateDesktop false

# Open new windows in the $HOME directory
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# Open new windows using column view
defaults write com.apple.Finder FXPreferredViewStyle clmv

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Automatically hide the Dock
defaults write com.apple.dock autohide -bool true

# Disable Hot Corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

###############################################################################
# Safari                                                                      #
###############################################################################

# Show debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Show Develop menu
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# Don't offer storing passwords
defaults write com.apple.Safari AutoFillPasswords -int 0

###############################################################################
# iTerm                                                                       #
###############################################################################

# Install terminal theme
if ! defaults read com.googlecode.iterm2 "Custom Color Presets" | grep "Dracula =" > /dev/null; then
  open "$HOME/dotfiles/init/files/Dracula.itermcolors"
fi

###############################################################################
# Shell                                                                       #
###############################################################################

ZSH_BIN=$(command -v zsh 2> /dev/null)

# Add ZSH to list of valid shells
if [[ -x "$ZSH_BIN" ]] && grep -q "$ZSH_BIN" /etc/shells; then
  echo "$ZSH_BIN" | sudo tee -a /etc/shells &> /dev/null
fi

# Change shell to ZSH
if [[ "$SHELL" != "$ZSH_BIN" ]]; then
  sudo chsh -s "$ZSH_BIN" "$USER"
  env "$ZSH_BIN"
fi

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "cfprefsd" "Dashboard" "Dock" "Finder" "Safari" "SystemUIServer"; do
  set +e
  killall "$app" > /dev/null 2>&1
  set -e
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
