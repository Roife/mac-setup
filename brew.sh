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
brew install screenfetch
#brew install pandoc
#brew install graphviz
brew install tmux
brew install trash
brew install the_silver_searcher
brew install tree
brew install cloc
brew install fzf
brew install ranger
brew install tig
brew install htop
brew install mas

# Installing Cask apps
#brew cask install shadowsocksx-ng
#brew cask install iina
#brew cask install dash
brew cask install bettertouchtool
brew cask install launchbar
brew cask install shortcat
brew cask install focus
#brew cask install contexts

# Installing Quicklook Plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch webpquicklook

# Remove outdated versions from the cellar.
brew cleanup

ranger --copy-config=all
/usr/local/opt/fzf/install

# mas
mas install 445189367
mas install 829912893
mas install 1127253508
