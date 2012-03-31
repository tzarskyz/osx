#!/usr/bin/env sh

# Description: Installs and configures Homebrew.
# Usage: ./homebrew.sh

# Homebrew
/usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

# Bash
brew install bash

# Git
brew install git

# Ruby
brew install rbenv
brew install ruby-build
rbenv install 1.9.3-p125
