echo "Development only script for Hyperledger Fabric control"


# Grab the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THIS_SCRIPT=`basename "$0"`
echo "Running '${THIS_SCRIPT}'"

if [ "${HL_FABRIC_VERSION}" ]; then
  export FABRIC_VERSION="${HL_FABRIC_VERSION}"
fi

if [ "${HL_FABRIC_START_TIMEOUT}" ]; then
  export FABRIC_START_TIMEOUT="${HL_FABRIC_START_TIMEOUT}"
fi

if [ -z ${FABRIC_VERSION+x} ]; then
 echo "FABRIC_VERSION is unset, assuming hlfv11"
 export FABRIC_VERSION="hlfv11"
else
 echo "FABRIC_VERSION is set