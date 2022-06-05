#!/bin/bash

# Exit on first error, print all commands.
set -e

# Set ARCH
ARCH=`uname -m`

# Grab the current directory.
DIR="$( cd "$( dirname 