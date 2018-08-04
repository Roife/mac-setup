#!/usr/bin/env bash

# Ask for the administrator password upfront.
export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;

./rc.sh
echo "======== rc.sh has finished ========"
./brew.sh
echo "======== brew.sh has finished ========"
./shell.sh
echo "======== shell.sh has finished ========"
./macos.sh
echo "======== macos.sh has finished ========"
sudo chown -R roife ~

echo "======== Finish! Please restart now! ========"
