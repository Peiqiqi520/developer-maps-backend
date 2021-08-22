#!/bin/bash

# Grab the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "${HL_COMPOSER_CLI}" ]; then
  HL_COMPOSER_CLI=$(which composer)
fi

echo
# check that the composer command exists at a version >v0.14
COMPOSER_VERSION=$("${HL_COMPOSER_CLI}" --version 2>/dev/null)
COMPOSER_RC=$?

if [ $COMPOSER_RC -eq 0 ]; then
    AWKRET=$(echo $COMPOSER_VERSION | awk -F. '{if ($2<15 || $2>16) print "1"; else print "0";}')
    if [ $AWKRET -eq 1 ]; then
        echo $COMPOSER_VERSION is not supported for this level of fabric. Please use version 0.16
        exit 1
    else
        echo Using composer-cli at $COMPOSER_VE