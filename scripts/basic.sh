#!/bin/sh

# DESCRIPTION
# Configures basic system settings.

# USAGE
# ./basic.sh

# EXECUTION
echo "Setting hostname..."
scutil --set ComputerName $SYSTEM_NAME
scutil --set HostName $SYSTEM_HOSTNAME

echo "Cleaning default directories..."
rm -rf $HOME/Documents/*
rm -rf $HOME/Downloads/*
