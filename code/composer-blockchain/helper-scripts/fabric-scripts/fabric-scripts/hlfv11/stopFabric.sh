#!/bin/bash

# Exit on first error, print all commands.
set -e

#Detect architecture
ARCH=`uname -m`

# Grab the current directorydirectory.
DIR="$( cd "$( dirname "${BASH_SOUR