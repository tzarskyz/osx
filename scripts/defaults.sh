#!/bin/sh

# DESCRIPTION
# Configures useful defaults for OSX.

# USAGE
# ./defaults.sh

# EXECUTION
echo "Show all filename extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "Disable window resume system-wide"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Set a fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Enable tap to click (Trackpad) for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Map bottom right Trackpad corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

echo "Show all filename extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "Map bottom right Trackpad corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

echo "Disable the “reopen windows when logging back in” option"
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

echo "Show the $HOME/Library folder"
chflags nohidden $HOME/Library

echo "Remove the auto-hiding Dock delay"
defaults write com.apple.Dock autohide-delay -float 0

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Hot Corner - Top right screen corner - Application Windows"
defaults write com.apple.dock wvous-tr-corner -int 3
defaults write com.apple.dock wvous-tr-modifier -int 0

echo "Hot Corner - Bottom right screen corner - Desktop"
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

echo "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Disable the Ping sidebar in iTunes"
defaults write com.apple.iTunes disablePingSidebar -bool true

echo "Disable all the Ping related features in iTunes"
defaults write com.apple.iTunes disablePing -bool true

echo "Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>'' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

echo "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Prevents Chrome from using it's own print dialog and uses the system dialog instead"
defaults write com.google.Chrome DisablePrintPreview -boolean true
