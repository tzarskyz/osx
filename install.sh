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
  echo "  x: Install application extensions (i.e. application enhancements, plug-ins, etc.)"
  echo "  d: Apply software defaults."
  echo "  w: Clean work directory."
  echo "  i: Perform complete install (i.e. basic settings, Homebrew, applications, extensions, defaults, and work directory clean-up)."
  echo "  c: Check status of installed applications and extensions."
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
    'x')
      scripts/extensions.sh
      break;;
    'd')
      scripts/defaults.sh
      break;;
    'w')
      clean_work_path
      break;;
    'i')
      scripts/basic.sh
      scripts/homebrew.sh
      scripts/applications.sh
      scripts/extensions.sh
      scripts/defaults.sh
      clean_work_path
      break;;
    'c')
      verify_installs
      verify_extensions
      break;;
    'q')
      break;;
  esac
done
echo ''
