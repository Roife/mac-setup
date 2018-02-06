#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
#while true do sudo -n true sleep 60 kill -0 "$$" || exit done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set clock style
defaults write com.apple.menuextra.clock DateFormat -string H:mm

# Use dark mode
defaults write -globalDomain AppleInterfaceStyle -string "Dark"

# stop using guest account
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "roife-mbp"
sudo scutil --set HostName "roife-mbp"
sudo scutil --set LocalHostName "roife-mbp"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "roife-mbp"

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Change alert sound to Hero
defaults write NSGlobalDomain com.apple.sound.beep.sound -string "/System/Library/Sounds/Hero.aiff"

# Change Temperature
defaults write -globalDomain AppleTemperatureUnit -string "Celsius"

# Set 24-hour
defaults write -globalDomain AppleICUForce24HourTime -bool true

# Disable shake mouse pointer to locate
defaults write -globalDomain CGDisableCursorLocationMagnification -bool true

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 10

# Setting Trackpad Gesture
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 1
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.AppleMultitouchTrackpad DragLock -int 0
defaults write com.apple.AppleMultitouchTrackpad Dragging -int 0
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadHandResting -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadHorizScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad USBMouseStopsTrackpad -int 0
defaults write com.apple.AppleMultitouchTrackpad UserPreferences -int 1

# Set Trackpad Speed
defaults write -g com.apple.trackpad.scaling 1

# Set Key Repeat
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)
defaults write -g ApplePressAndHoldEnabled -bool false

# Set CapsLock to Control (1452-628-0 is your product ID)
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1452-628-0 -array "<dict><key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer><key>HIDKeyboardModifierMappingDst</key><integer>30064771296</integer></dict>"

# Set Key Shortcut
# /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:IconViewSettings:enabled false"
## launchpad & dock
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:52:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Turn Dock Hiding On/Off - Command, Option, D
## mission control
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:36:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Desktop - F11
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:62:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Dashboard - F12
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:118:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Switch to Space 1 - Control, 1
## keyboard
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:13:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Change the way Tab moves focus - Control, F7
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:7:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Move focus to the menu bar - Control, F2
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:8:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Move focus to the Dock - Control, F3
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:9:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Move focus to active or next window - Control, F4
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:10:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Move focus to window toolbar - Control, F5
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:11:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Move focus to floating window - Control, F6
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:12:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Turn Keyboard Access on or off - Control, F1
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:57:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Move focus to the status menus - Control, F8
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:51:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Move focus to the window drawer - Command, Option, `
## Input Sources
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:60:enabled true" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:60:value:parameters:0 32" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:60:value:parameters:1 49" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:60:value:parameters:2 262144" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Select the previous input source - Control Space
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:61:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Select the next source in the Input Menu - Command, Option, Shift, Space
## Screen Shot
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:28:value:parameters:0 51" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:28:value:parameters:1 20" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:28:value:parameters:2 1441792" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Select the previous input source - Command, Option, Space

/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:29:value:parameters:0 51" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:29:value:parameters:1 20" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:29:value:parameters:2 1310720" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Select the previous input source - Command, Option, Space

/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:30:value:parameters:0 52" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:30:value:parameters:1 21" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:30:value:parameters:2 1441792" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Select the previous input source - Command, Option, Space

/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:31:value:parameters:0 52" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:31:value:parameters:1 21" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:31:value:parameters:2 1310720" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Select the previous input source - Command, Option, Space

## Spotlight
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:65:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Show finder search window - Command, Option, Space
## Accessbility
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:59:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Turn VoiceOver on / off - Command, F5
/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:162:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist # Show accessbility control - Command, Option, F5

###############################################################################
# Finder                                                                      #
###############################################################################

# Show icons on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show item info to the right of the icons on the desktop?
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views?
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
###############################################################################
# Spotlight                                                                   #
###############################################################################
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 1;"name" = "MESSAGES";}' \
	'{"enabled" = 1;"name" = "CONTACT";}' \
	'{"enabled" = 1;"name" = "EVENT_TODO";}' \
	'{"enabled" = 1;"name" = "IMAGES";}' \
	'{"enabled" = 1;"name" = "BOOKMARKS";}' \
	'{"enabled" = 1;"name" = "MUSIC";}' \
	'{"enabled" = 1;"name" = "MOVIES";}' \
	'{"enabled" = 1;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 1;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 1;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 1;"name" = "MENU_OTHER";}' \
	'{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 1;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 1;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
#defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Minimize windows to app icons
defaults write com.apple.dock minimize-to-application -bool true

# disable magnification
defaults write com.apple.dock magnification -int 0

# dock show on the left
defaults write com.apple.dock orientation -string "left"

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock
#defaults write com.apple.dock static-only -bool true

# set launchpad
defaults write com.apple.dock springboard-columns -int 7
defaults write com.apple.dock springboard-rows -int 5
defaults write com.apple.dock ResetLaunchPad -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 11
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

# Terminal
open ./gruvbox-dark.terminal
