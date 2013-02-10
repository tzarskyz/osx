#!/bin/sh

# DESCRIPTION
# Configures basic system settings.

# USAGE
# ./basic.sh

# EXECUTION
echo "Setting system label and name..."
sudo scutil --set ComputerName $SYSTEM_LABEL
sudo scutil --set HostName $SYSTEM_NAME
sudo scutil --set LocalHostName $SYSTEM_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $SYSTEM_NAME

echo "Cleaning default directories..."
rm -rf $HOME/Documents/*
rm -rf $HOME/Downloads/*
