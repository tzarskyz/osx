#!/bin/sh

# DESCRIPTION
# Executes all OSX setup scripts.

# USAGE
# ./run.sh

# SETTINGS
set -u # Exit if any variables are uninitialised.
set -e # Exit if any command returns non-zero.
export SYSTEM_LABEL=RA # Placeholder for system display name.
export SYSTEM_NAME=ra # Placeholder for system name.
export WORK_PATH=/private/tmp/downloads # Temporary location for processing of file downloads and installers.

# FUNCTIONS
. functions/installers.sh

# EXECUTION
echo "Setting OSX basic settings..."
scripts/basic.sh

echo "Installing OSX software..."
scripts/software.sh

echo "Setting OSX defaults..."
scripts/defaults.sh

echo "Cleaning..."
rm -rf $WORK_PATH

echo "OSX setup complete!"
