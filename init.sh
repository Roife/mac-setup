#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install command line tool
# xcode-select --install

# homebrew settings
./brew.sh
echo "======== brew.sh is finished ========"
./shell.sh
echo "======== shell.sh is finished ========"
./macos.sh
echo "======== macos.sh is finished ========"
./rc.sh


echo "======== Finish! Please restart now! ========"
