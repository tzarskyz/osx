#!/bin/sh

# DESCRIPTION
# Installs and configures OSX software.

# USAGE
# ./software.sh

# EXECUTION
# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Bash Completion (http://bash-completion.alioth.debian.org)
brew install bash-completion

# Git
brew install git

# GitHub
brew install hub

# Pigz (http://www.zlib.net/pigz)
brew install pigz

# JSON CLI Parser (http://stedolan.github.com/jq)
brew install jq

# Network Grep (http://ngrep.sourceforge.net)
brew install ngrep

# ImageMagick
brew install imagemagick

# Graphviz
brew install graphviz

# Node
brew install node

# Phantom.js
brew install phantomjs

# Ruby Gems
git clone git://github.com/bkuhlmann/ruby_gem_setup.git
cd ruby_gem_setup
./install.sh
cd $HOME
rm -rf ruby_gem_setup

# Ruby
brew install rbenv
brew install rbenv-gem-rehash
brew install rbenv-default-gems
brew install rbenv-vars
cp ../settings/rbenv-vars.txt $HOME/.rbenv/vars
brew install --HEAD ruby-build
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv rehash

# Dotfiles
git clone git://github.com/bkuhlmann/dotfiles.git
cd dotfiles
./install.sh
cd $HOME
rm -rf dotfiles
source $HOME/.bashrc

# Pow
curl get.pow.cx | sh

# PostgreSQL
brew install postgresql
initdb /usr/local/var/postgres -E utf8

cp /usr/local/Cellar/postgresql/*/homebrew.mxcl.postgresql.plist $HOME/Library/LaunchAgents
launchctl load -w $HOME/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Redis
brew install redis
cp /usr/local/Cellar/redis/*/homebrew.mxcl.redis.plist $HOME/Library/LaunchAgents/
launchctl load -w $HOME/Library/LaunchAgents/homebrew.mxcl.redis.plist

# Caffeine
install_zip_app $CAFFEINE_URL $CAFFEINE_FILE

# Dropbox
install_dmg_app $DROPBOX_URL $DROPBOX_FILE "Dropbox Installer"

# Knox
install_zip_app $KNOX_URL $KNOX_FILE

# iTerm
install_zip_app $ITERM_URL $ITERM_FILE

# Sublime Text 2
install_dmg_app $SUBLIME_TEXT_URL $SUBLIME_TEXT_FILE "Sublime Text 2"
sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/bin/sublime

# Alfred
install_dmg_app $ALFRED_URL $ALFRED_FILE "Alfred.app"

# TextExpander
install_zip_app $TEXTEXPANDER_URL $TEXTEXPANDER_FILE "TextExpander.app"

# Path Finder
install_dmg_app $PATH_FINDER_URL $PATH_FINDER_FILE "Path Finder"

# Firefox
install_dmg_app $FIREFOX_URL $FIREFOX_FILE "Firefox"

# Google Chrome
install_dmg_app $CHROME_URL $CHROME_FILE "Google Chrome"

# Opera
install_dmg_app $OPERA_URL $OPERA_FILE "Opera"

# OmniFocus
install_dmg_app $OMNIFOCUS_URL $OMNIFOCUS_FILE "OmniFocus"

# OmniOutliner
install_dmg_app $OMNIOUTLINER_URL $OMNIOUTLINER_FILE "OmniOutliner"

# OmniGraffle
install_dmg_app $OMNIGRAFFLE_URL $OMNIGRAFFLE_FILE "OmniGrafflePro"

# OmniDazzle
install_dmg_app $OMNIDAZZLE_URL $OMNIDAZZLE_FILE "OmniDazzle"

# ExpanDrive
install_zip_app $EXPANDRIVE_URL $EXPANDRIVE_FILE

# iStat Menus (the app is the installer)
download_only $ISTATS_URL $ISTATS_FILE

# Air Display
install_dmg_pkg $AIR_DISPLAY_URL $AIR_DISPLAY_FILE "Air Display Installer"

# Pastebot Sync (preference pane)
download_only $PASTEBOT_SYNC_URL $PASTEBOT_SYNC_FILE

# Bartender
install_zip_app $BARTENDER_URL $BARTENDER_FILE

# GitHub
install_zip_app $GITHUB_URL $GITHUB_FILE

# GitX
install_zip_app $GITX_URL $GITX_FILE

# Snippets
install_zip_app $SNIPPETS_URL $SNIPPETS_FILE

# Espresso
install_zip_app $ESPRESSO_URL $ESPRESSO_FILE

# CodeKit
install_zip_app $CODEKIT_URL $CODEKIT_FILE

# Acorn
install_zip_app $ACORN_URL $ACORN_FILE

# DoubleTake
install_dmg_app $DOUBLETAKE_URL $DOUBLETAKE_FILE "DoubleTake"

# ImageOptim
install_tar_app $IMAGE_OPTIM_URL $IMAGE_OPTIM_FILE "-xjf"

# VLC
install_dmg_app $VLC_URL $VLC_FILE "vlc-2.0.1"

# Induction
install_zip_app $INDUCTION_URL $INDUCTION_FILE

# PG Admin
install_dmg_app $PG_ADMIN_URL $PG_ADMIN_FILE "pgAdmin3"

# Namebench
install_dmg_app $NAMEBENCH_URL $NAMEBENCH_FILE "namebench"

# Billings
install_zip_app $BILLINGS_URL $BILLINGS_FILE

# MoneyWell
install_zip_app $MONEYWELL_URL $MONEYWELL_FILE

# Delicious Library
install_zip_app $DELICIOUS_LIBRARY_URL $DELICIOUS_LIBRARY_FILE

# OpenOffice
install_dmg_app $OPEN_OFFICE_URL $OPEN_OFFICE_FILE "OpenOffice.org 3.3"

# Colloquy
install_zip_app $COLLOQUY_URL $COLLOQUY_FILE

# Skype
install_dmg_app $SKYPE_URL $SKYPE_FILE "Skype"

# VirtualBox
install_dmg_pkg $VIRTUAL_BOX_URL $VIRTUAL_BOX_FILE "VirtualBox"

# Eye-Fi
install_dmg_pkg $EYEFI_URL $EYEFI_FILE "Eye-Fi Installer"

# Doxie
install_dmg_pkg $DOXIE_URL $DOXIE_FILE "Doxie"
