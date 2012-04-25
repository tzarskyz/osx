#!/usr/bin/env sh

# Description: Executes all OSX setup scripts.
# Usage: ./setup.sh

echo "\nSetting OSX defaults...\n"
scripts/defaults.sh

echo "\nInstalling Homebrew...\n"
scripts/homebrew.sh

echo "\nOSX setup complete!\n"