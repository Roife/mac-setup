#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
#sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Installing CLI tools
brew install wget
#brew install pandoc
#brew install graphviz
brew install tmux
#brew install the_silver_searcher

# Installing useful tools
brew install tree
brew install cloc

# Installing Cask apps
brew cask install shadowsocksx-ng
brew cask install iina
brew cask install dash
brew cask install sublime-text
brew cask install bettertouchtool
brew cask install launchbar
brew cask install shortcat
brew cask install contexts

# unclutter
# qq
# mathstudio
# Affinity Photo
# Affinity Designer

# Installing Quicklook Plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch betterzipql webpquicklook

# Remove outdated versions from the cellar.
brew cleanup
