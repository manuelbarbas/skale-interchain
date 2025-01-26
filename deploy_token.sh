#!/bin/bash

set -eE

cd tokens

TOKEN=$1
BASE_NETWORK=$2
DEST_NETWORK=$3

forge script ./script/FullInterchainDeployment.s.sol \
    --sig "run(string,string, string)" $TOKEN $BASE_NETWORK $DEST_NETWORK \
    --legacy -vvvv