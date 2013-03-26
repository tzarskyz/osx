#!/bin/sh

# DESCRIPTION
# Installs OSX application extensions.

# EXECUTION
# Sublime Text 2 - GitGutter
install_git_app "$GIT_GUTTER_EXTENSION_URL" "$GIT_GUTTER_EXTENSION_PATH"

# Sublime Text 2 - EasyMotion
install_git_app "$EASY_MOTION_EXTENSION_URL" "$EASY_MOTION_EXTENSION_PATH"
