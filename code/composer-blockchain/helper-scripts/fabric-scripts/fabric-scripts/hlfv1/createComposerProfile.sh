#!/bin/bash

# Exit on first error, print all commands.
set -ev
# Grab the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf ~/.composer-connection-profiles/hlfv1/*
rm -rf ~/.composer-credentials/*

# copy org admin credentials into the keyValStore
mkdir -p ~/.composer-credentials
cp "${DIR}"/composer/creds/* ~/.composer-credentials

# create a composer connection profile
mkdir -p ~/.composer-connection-profiles/hlfv1
cat << EOF > ~/.composer-connection-profiles/hlfv1/connection.json
{
    "type": "hlfv1",
    "orderers": [
     