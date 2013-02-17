#!/bin/sh

# DESCRIPTION
# Installs OSX applications.

# EXECUTION
# Caffeine
install_zip_app "$CAFFEINE_APP_URL" "$CAFFEINE_APP_FILE" "$CAFFEINE_APP_NAME"

# Dropbox
install_dmg_app "$DROPBOX_APP_URL" "$DROPBOX_APP_FILE" "Dropbox Installer" "$DROPBOX_APP_NAME"

# Knox
install_zip_app "$KNOX_APP_URL" "$KNOX_APP_FILE" "$KNOX_APP_NAME"

# iTerm
install_zip_app "$ITERM_APP_URL" "$ITERM_APP_FILE" "$ITERM_APP_NAME"

# Sublime Text 2
install_dmg_app "$SUBLIME_TEXT_APP_URL" "$SUBLIME_TEXT_APP_FILE" "Sublime Text 2" "$SUBLIME_TEXT_APP_NAME"
sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/bin/sublime

# Alfred
install_dmg_app "$ALFRED_APP_URL" "$ALFRED_APP_FILE" "Alfred.app" "$ALFRED_APP_NAME"

# TextExpander
install_zip_app "$TEXTEXPANDER_APP_URL" "$TEXTEXPANDER_APP_FILE" "$TEXTEXPANDER_APP_NAME"

# Path Finder
install_dmg_app "$PATH_FINDER_APP_URL" "$PATH_FINDER_APP_FILE" "Path Finder" "$PATH_FINDER_APP_NAME"

# Firefox
install_dmg_app "$FIREFOX_APP_URL" "$FIREFOX_APP_FILE" "Firefox" "$FIREFOX_APP_NAME"

# Google Chrome
install_dmg_app "$CHROME_APP_URL" "$CHROME_APP_FILE" "Google Chrome" "$CHROME_APP_NAME"

# Opera
install_dmg_app "$OPERA_APP_URL" "$OPERA_APP_FILE" "Opera" "$OPERA_APP_NAME"

# OmniFocus
install_dmg_app "$OMNIFOCUS_APP_URL" "$OMNIFOCUS_APP_FILE" "OmniFocus" "$OMNIFOCUS_APP_NAME"

# OmniOutliner
install_dmg_app "$OMNIOUTLINER_APP_URL" "$OMNIOUTLINER_APP_FILE" "OmniOutliner" "$OMNIOUTLINER_APP_NAME"

# OmniGraffle
install_dmg_app "$OMNIGRAFFLE_APP_URL" "$OMNIGRAFFLE_APP_FILE" "OmniGrafflePro" "$OMNIGRAFFLE_APP_NAME"

# OmniDazzle
install_dmg_app "$OMNIDAZZLE_APP_URL" "$OMNIDAZZLE_APP_FILE" "OmniDazzle" "$OMNIDAZZLE_APP_NAME"

# ExpanDrive
install_zip_app "$EXPANDRIVE_APP_URL" "$EXPANDRIVE_APP_FILE" "$EXPANDRIVE_APP_NAME"

# iStat Menus (the app is the installer)
install_zip_app "$ISTATS_APP_URL" "$ISTATS_APP_FILE" "$ISTATS_APP_NAME"

# Bartender
install_zip_app "$BARTENDER_APP_URL" "$BARTENDER_APP_FILE" "$BARTENDER_APP_NAME"

# GitHub
install_zip_app "$GITHUB_APP_URL" "$GITHUB_APP_FILE" "$GITHUB_APP_NAME"

# GitX
install_zip_app "$GITX_APP_URL" "$GITX_APP_FILE" "$GITX_APP_NAME"

# Snippets
install_zip_app "$SNIPPETS_APP_URL" "$SNIPPETS_APP_FILE" "$SNIPPETS_APP_NAME"

# Espresso
install_zip_app "$ESPRESSO_APP_URL" "$ESPRESSO_APP_FILE" "$ESPRESSO_APP_NAME"

# CodeKit
install_zip_app "$CODEKIT_APP_URL" "$CODEKIT_APP_FILE" "$CODEKIT_APP_NAME"

# Acorn
install_zip_app "$ACORN_APP_URL" "$ACORN_APP_FILE" "$ACORN_APP_NAME"

# DoubleTake
install_dmg_app "$DOUBLETAKE_APP_URL" "$DOUBLETAKE_APP_FILE" "DoubleTake" "$DOUBLETAKE_APP_NAME"

# ImageOptim
install_tar_app "$IMAGE_OPTIM_APP_URL" "$IMAGE_OPTIM_APP_FILE" "-xjf" "$IMAGE_OPTIM_APP_NAME"

# VLC
install_dmg_app "$VLC_APP_URL" "$VLC_APP_FILE" "vlc-2.0.1" "$VLC_APP_NAME"

# Induction
install_zip_app "$INDUCTION_APP_URL" "$INDUCTION_APP_FILE" "$INDUCTION_APP_NAME"

# PG Admin
install_dmg_app "$PG_ADMIN_APP_URL" "$PG_ADMIN_APP_FILE" "pgAdmin3" "$PG_ADMIN_APP_NAME"

# Namebench
install_dmg_app "$NAMEBENCH_APP_URL" "$NAMEBENCH_APP_FILE" "namebench" "$NAMEBENCH_APP_NAME"

# Billings
install_zip_app "$BILLINGS_APP_URL" "$BILLINGS_APP_FILE" "$BILLINGS_APP_NAME"

# MoneyWell
install_zip_app "$MONEYWELL_APP_URL" "$MONEYWELL_APP_FILE" "$MONEYWELL_APP_NAME"

# Delicious Library
install_zip_app "$DELICIOUS_LIBRARY_APP_URL" "$DELICIOUS_LIBRARY_APP_FILE" "$DELICIOUS_LIBRARY_APP_NAME"

# OpenOffice
install_dmg_app "$OPEN_OFFICE_APP_URL" "$OPEN_OFFICE_APP_FILE" "OpenOffice.org 3.3" "$OPEN_OFFICE_APP_NAME"

# Colloquy
install_zip_app "$COLLOQUY_APP_URL" "$COLLOQUY_APP_FILE" "$COLLOQUY_APP_NAME"

# Skype
install_dmg_app "$SKYPE_APP_URL" "$SKYPE_APP_FILE" "Skype" "$SKYPE_APP_NAME"

# VirtualBox
install_dmg_pkg "$VIRTUAL_BOX_APP_URL" "$VIRTUAL_BOX_APP_FILE" "VirtualBox" "$VIRTUAL_BOX_APP_NAME"

# Doxie
install_dmg_pkg "$DOXIE_APP_URL" "$DOXIE_APP_FILE" "Doxie" "$DOXIE_APP_NAME"

# Pastebot Sync (preference pane)
download_only "$PASTEBOT_SYNC_APP_URL" "$PASTEBOT_SYNC_APP_FILE"

# Air Display
download_only "$AIR_DISPLAY_APP_URL" "$AIR_DISPLAY_APP_FILE"

# Eye-Fi
download_only "$EYEFI_APP_URL" "$EYEFI_APP_FILE"
