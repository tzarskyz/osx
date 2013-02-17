#!/bin/sh

# DESCRIPTION
# Executes all OSX setup scripts.

# USAGE
# ./run.sh

# SETTINGS
set -u # Exit if any variables are uninitialised.
set -e # Exit if any command returns non-zero.
. settings/settings.sh

# FUNCTIONS
. functions/installers.sh

# EXECUTION
read -p "Are the OSX software update, Xcode, etc. requirements complete? (y/n)?: " response
if [ "$response" == 'y' ]; then
  echo "Setting OSX basic settings..."
  scripts/basic.sh

  echo "Installing OSX software..."
  scripts/software.sh

  echo "Setting OSX defaults..."
  scripts/defaults.sh

  echo "Cleaning..."
  rm -rf $WORK_PATH

  echo "OSX setup complete!"
else
  echo "Whew, that was a close one. OSX setup aborted."
fi
