#!/bin/sh

# DESCRIPTION
# Installs and configures OSX software.

# USAGE
# ./software.sh

# SETTINGS
export RUBY_VERSION=1.9.3-p385
export CAFFEINE_URL=http://lightheadsw.com/files/releases/com.lightheadsw.Caffeine
export CAFFEINE_FILE=Caffeine1.1.1.zip
export DROPBOX_URL=https://d1ilhw0800yew8.cloudfront.net/client
export DROPBOX_FILE=Dropbox%201.6.16.dmg
export KNOX_URL=https://d13itkw33a7sus.cloudfront.net/dist/K
export KNOX_FILE=Knox-2.2.0.zip
export ITERM_URL=https://iterm2.googlecode.com/files
export ITERM_FILE=iTerm2-1_0_0_20130122.zip
export SUBLIME_TEXT_URL=http://c758482.r82.cf2.rackcdn.com
export SUBLIME_TEXT_FILE=Sublime%20Text%202.0.1.dmg
export ALFRED_URL=http://cachefly.alfredapp.com
export ALFRED_FILE=alfred_1.3.1_261.dmg
export TEXTEXPANDER_URL=http://cdn.smilesoftware.com
export TEXTEXPANDER_FILE=TextExpander_4.0.5.zip
export PATH_FINDER_URL=http://get.cocoatech.com
export PATH_FINDER_FILE=PF6_LION.zip
export FIREFOX_URL=http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/18.0.2/mac/en-US
export FIREFOX_FILE=Firefox%2018.0.2.dmg
export CHROME_URL=https://dl.google.com/chrome/mac/stable/GGRO
export CHROME_FILE=googlechrome.dmg
export OPERA_URL=http://get3.opera.com/pub/opera/mac/1214
export OPERA_FILE=Opera_12.14_Setup_Intel.dmg
export OMNIFOCUS_URL=http://downloads2.omnigroup.com/software/MacOSX/10.6
export OMNIFOCUS_FILE=OmniFocus-1.10.4.dmg
export OMNIOUTLINER_URL=http://downloads2.omnigroup.com/software/MacOSX/10.4
export OMNIOUTLINER_FILE=OmniOutliner-3.10.6.dmg
export OMNIGRAFFLE_URL=http://downloads2.omnigroup.com/software/MacOSX/10.6
export OMNIGRAFFLE_FILE=OmniGrafflePro-5.4.2.dmg
export OMNIDAZZLE_URL=http://downloads2.omnigroup.com/software/MacOSX/10.6
export OMNIDAZZLE_FILE=OmniDazzle-1.2.dmg
export EXPANDRIVE_URL=http://downloads.expandrive.com/expandrive/v2-3-1_published_2012-03-07_at_15_18_52
export EXPANDRIVE_FILE=ExpanDrive.zip
export ISTATS_URL=http://s3.amazonaws.com/bjango/files/istatmenus4
export ISTATS_FILE=istatmenus4.03.zip
export AIR_DISPLAY_URL=http://avatron.com/downloads
export AIR_DISPLAY_FILE=AirDisplayInstaller.dmg
export PASTEBOT_SYNC_URL=http://tapbots.net/pastebot
export PASTEBOT_SYNC_FILE=PastebotSync.dmg
export BARTENDER_URL=http://www.macbartender.com/Demo
export BARTENDER_SYNC_FILE=Bartender.zip
export GITHUB_URL=https://github-central.s3.amazonaws.com
export GITHUB_FILE=mac%2FGitHub%20for%20Mac%20107.zip
export GITX_URL=https://github.com/downloads/laullon/gitx
export GITX_FILE=GitX-L_v0.8.4.zip
export SNIPPETS_URL=http://www.snippetsapp.com/download
export SNIPPETS_FILE=Snippets-1.4.1.zip
export ESPRESSO_URL=https://s3.amazonaws.com/macrabbit/downloads
export ESPRESSO_FILE=Espresso%202.0.5.zip
export CODEKIT_URL=http://incident57.com/codekit/files
export CODEKIT_FILE=codekit-8248.zip
export ACORN_URL=http://flyingmeat.com/download
export ACORN_FILE=Acorn.zip
export DOUBLETAKE_URL=http://echoone.com/doubletake
export DOUBLETAKE_FILE=DoubleTake.dmg
export IMAGE_OPTIM_URL=http://imageoptim.com
export IMAGE_OPTIM_FILE=ImageOptim.tbz2
export VLC_URL=http://hivelocity.dl.sourceforge.net/project/vlc/2.0.5/macosx
export VLC_FILE=vlc-2.0.5.dmg
export INDUCTION_URL=https://mesmerize.s3.amazonaws.com/Induction
export INDUCTION_FILE=Induction-28.zip
export PG_ADMIN_URL=http://ftp.postgresql.org/pub/pgadmin3/release/v1.16.1/osx
export PG_ADMIN_FILE=pgadmin3-1.16.1.dmg
export NAMEBENCH_URL=http://namebench.googlecode.com/files/namebench-1.3.1-Mac_OS_X.dmg
export NAMEBENCH_FILE=namebench-1.3.1-Mac_OS_X.dmg
export BILLINGS_URL=http://download.marketcircle.com/billings
export BILLINGS_FILE=Billings376.zip
export MONEYWELL_URL=http://downloads.nothirst.com
export MONEYWELL_FILE=MoneyWell_17.zip
export DELICIOUS_LIBRARY_URL=http://www.delicious-monster.com/downloads
export DELICIOUS_LIBRARY_FILE=DeliciousLibrary2.zip
export OPEN_OFFICE_URL=http://hivelocity.dl.sourceforge.net/project/openofficeorg.mirror/stable/3.4.1
export OPEN_OFFICE_FILE=Apache_OpenOffice_incubating_3.4.1_MacOS_x86_install_en-US.dmg
export COLLOQUY_URL=http://colloquy.info/downloads
export COLLOQUY_FILE=colloquy-latest.zip
export SKYPE_URL=http://download.skype.com/macosx
export SKYPE_FILE=Skype_6.2.0.1117.dmg
export VIRTUAL_BOX_URL=http://download.virtualbox.org/virtualbox/4.2.6
export VIRTUAL_BOX_FILE=VirtualBox-4.2.6-82870-OSX.dmg
export EYEFI_URL=http://support.eye.fi/agent/download/3.4.29
export EYEFI_FILE=Eye-Fi.dmg
export DOXIE_URL=http://www.getdoxie.com/resources/files
export DOXIE_FILE=Doxie.dmg

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
cp ../templates/rbenv_vars.txt $HOME/.rbenv/vars
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
initdb /usr/local/var/postgres

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
