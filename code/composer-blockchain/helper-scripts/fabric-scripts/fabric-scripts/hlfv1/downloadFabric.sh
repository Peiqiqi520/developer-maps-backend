#!/bin/bash

# Exit on first error, print all commands.
set -ev

# Set ARCH
ARCH=`uname -m`

# Grab the current directory.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Pull and tag the latest Hyperledger Fabric base image.
docker pull hyperledger/fabric-peer:$ARCH-1.0.4
docker pull hy