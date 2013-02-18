#!/bin/sh

# DESCRIPTION
# Executes all OSX setup scripts.

# USAGE
# ./install.sh

# SETTINGS
set -e # Exit if any command returns non-zero.
source settings/settings.sh

# FUNCTIONS
source functions/functions.sh

# EXECUTION
echo ''
while true; do
  echo "Options:"
  echo "  b: Apply basic machine settings."
  echo "  h: Install Homebrew software."
  echo "  a: Install application software."
  echo "  d: Apply software defaults."
  echo "  c: Clean install working directory."
  echo "  i: Install all of the above (in order listed)."
  echo "  q: Quit/Exit."
  echo ''
  read -p "Enter selection: " response
  case $response in
    'b')
      scripts/basic.sh
      break;;
    'h')
      scripts/homebrew.sh
      break;;
    'a')
      scripts/applications.sh
      break;;
    'd')
      scripts/defaults.sh
      break;;
    'c')
      rm -rfv $WORK_PATH
      break;;
    'a')
      scripts/basic.sh
      scripts/homebrew.sh
      scripts/applications.sh
      scripts/defaults.sh
      rm -rfv $WORK_PATH
      break;;
    'q')
      break;;
  esac
done
echo ''
