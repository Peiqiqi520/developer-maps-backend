#!/bin/bash

# Exit on first error, print all commands.
set -ev
# Grab the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf ~/.composer-connection-profiles/hlfv1/*
rm -rf ~/.composer-cr