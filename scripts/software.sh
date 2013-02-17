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
install_zip_app $CAFFEINE_URL $CAFFEINE_FILE $CAFFEINE_NAME

# Dropbox
install_dmg_app $DROPBOX_URL $DROPBOX_FILE "Dropbox Installer" $DROPBOX_NAME

# Knox
install_zip_app $KNOX_URL $KNOX_FILE $KNOX_NAME

# iTerm
install_zip_app $ITERM_URL $ITERM_FILE $ITERM_NAME

# Sublime Text 2
install_dmg_app $SUBLIME_TEXT_URL $SUBLIME_TEXT_FILE "Sublime Text 2" $SUBLIME_TEXT_NAME
sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/bin/sublime

# Alfred
install_dmg_app $ALFRED_URL $ALFRED_FILE "Alfred.app" $ALFRED_NAME

# TextExpander
install_zip_app $TEXTEXPANDER_URL $TEXTEXPANDER_FILE "TextExpander.app" $TEXTEXPANDER_NAME

# Path Finder
install_dmg_app $PATH_FINDER_URL $PATH_FINDER_FILE "Path Finder" $PATH_FINDER_NAME

# Firefox
install_dmg_app $FIREFOX_URL $FIREFOX_FILE "Firefox" $FIREFOX_NAME

# Google Chrome
install_dmg_app $CHROME_URL $CHROME_FILE "Google Chrome" $CHROME_NAME

# Opera
install_dmg_app $OPERA_URL $OPERA_FILE "Opera" $OPERA_NAME

# OmniFocus
install_dmg_app $OMNIFOCUS_URL $OMNIFOCUS_FILE "OmniFocus" $OMNIFOCUS_NAME

# OmniOutliner
install_dmg_app $OMNIOUTLINER_URL $OMNIOUTLINER_FILE "OmniOutliner" $OMNIOUTLINER_NAME

# OmniGraffle
install_dmg_app $OMNIGRAFFLE_URL $OMNIGRAFFLE_FILE "OmniGrafflePro" $OMNIGRAFFLE_NAME

# OmniDazzle
install_dmg_app $OMNIDAZZLE_URL $OMNIDAZZLE_FILE "OmniDazzle" $OMNIDAZZLE_NAME

# ExpanDrive
install_zip_app $EXPANDRIVE_URL $EXPANDRIVE_FILE $EXPANDRIVE_NAME

# iStat Menus (the app is the installer)
download_only $ISTATS_URL $ISTATS_FILE $ISTATS_NAME

# Air Display
install_dmg_pkg $AIR_DISPLAY_URL $AIR_DISPLAY_FILE "Air Display Installer" $AIR_DISPLAY_NAME

# Pastebot Sync (preference pane)
download_only $PASTEBOT_SYNC_URL $PASTEBOT_SYNC_FILE

# Bartender
install_zip_app $BARTENDER_URL $BARTENDER_FILE $BARTENDER_NAME

# GitHub
install_zip_app $GITHUB_URL $GITHUB_FILE $GITHUB_NAME

# GitX
install_zip_app $GITX_URL $GITX_FILE $GITX_NAME

# Snippets
install_zip_app $SNIPPETS_URL $SNIPPETS_FILE $SNIPPETS_NAME

# Espresso
install_zip_app $ESPRESSO_URL $ESPRESSO_FILE $ESPRESSO_NAME

# CodeKit
install_zip_app $CODEKIT_URL $CODEKIT_FILE $CODEKIT_NAME

# Acorn
install_zip_app $ACORN_URL $ACORN_FILE $ACORN_NAME

# DoubleTake
install_dmg_app $DOUBLETAKE_URL $DOUBLETAKE_FILE "DoubleTake" $DOUBLETAKE_NAME

# ImageOptim
install_tar_app $IMAGE_OPTIM_URL $IMAGE_OPTIM_FILE "-xjf" $IMAGE_OPTIM_NAME

# VLC
install_dmg_app $VLC_URL $VLC_FILE "vlc-2.0.1" $VLC_NAME

# Induction
install_zip_app $INDUCTION_URL $INDUCTION_FILE $INDUCTION_NAME

# PG Admin
install_dmg_app $PG_ADMIN_URL $PG_ADMIN_FILE "pgAdmin3" $PG_ADMIN_NAME

# Namebench
install_dmg_app $NAMEBENCH_URL $NAMEBENCH_FILE "namebench" $NAMEBENCH_NAME

# Billings
install_zip_app $BILLINGS_URL $BILLINGS_FILE $BILLINGS_NAME

# MoneyWell
install_zip_app $MONEYWELL_URL $MONEYWELL_FILE $MONEYWELL_NAME

# Delicious Library
install_zip_app $DELICIOUS_LIBRARY_URL $DELICIOUS_LIBRARY_FILE $DELICIOUS_LIBRARY_NAME

# OpenOffice
install_dmg_app $OPEN_OFFICE_URL $OPEN_OFFICE_FILE "OpenOffice.org 3.3" $OPEN_OFFICE_NAME

# Colloquy
install_zip_app $COLLOQUY_URL $COLLOQUY_FILE $COLLOQUY_NAME

# Skype
install_dmg_app $SKYPE_URL $SKYPE_FILE "Skype" $SKYPE_NAME

# VirtualBox
install_dmg_pkg $VIRTUAL_BOX_URL $VIRTUAL_BOX_FILE "VirtualBox" $VIRTUAL_BOX_NAME

# Eye-Fi
install_dmg_pkg $EYEFI_URL $EYEFI_FILE "Eye-Fi Installer" $EYEFI_NAME

# Doxie
install_dmg_pkg $DOXIE_URL $DOXIE_FILE "Doxie" $DOXIE_NAME
