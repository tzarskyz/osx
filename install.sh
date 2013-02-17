#!/bin/sh

# DESCRIPTION
# Executes all OSX setup scripts.

# USAGE
# ./install.sh

# SETTINGS
set -e # Exit if any command returns non-zero.
source settings/settings.sh

# FUNCTIONS
source functions/installers.sh

# EXECUTION
echo ''
while true; do
  echo "Options:"
  echo "  b: Apply basic machine settings."
  echo "  s: Install software."
  echo "  d: Apply software defaults."
  echo "  c: Clean install working directories and files."
  echo "  a: Execute all of the above (in order defined)."
  echo "  q: Quit/Exit."
  echo ''
  read -p "Enter selection: " response
  case $response in
    'b')
      scripts/basic.sh
      break;;
    's')
      scripts/software.sh
      break;;
    'd')
      scripts/defaults.sh
      break;;
    'c')
      rm -rfv $WORK_PATH
      break;;
    'a')
      scripts/basic.sh
      scripts/software.sh
      scripts/defaults.sh
      rm -rfv $WORK_PATH
      break;;
    'q')
      break;;
  esac
done
echo ''
