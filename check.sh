#!/bin/sh

# DESCRIPTION
# Checks and prints status OSX application installation.

# USAGE
# ./check.sh

# SETTINGS
set -e # Exit if any command returns non-zero.
source settings/settings.sh

# FUNCTIONS
source functions/installers.sh

# EXECUTION
check_installs
