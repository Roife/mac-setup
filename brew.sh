#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

# Installing CLI tools
brew install pandoc
brew install tree
brew install cloc
brew install ripgrep
brew install gnuplot

# Install for zsh
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

# Install emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus --without-spacemacs-icon

# Installing Cask apps
brew cask install bettertouchtool
brew cask install launchbar

# Installing Quicklook Plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch webpquicklook

# Remove outdated versions from the cellar.
brew cleanup
