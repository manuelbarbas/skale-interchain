#!/bin/bash

set -eE

cd multisigwallet-cli

./scripts/prepare.sh

yarn install

cd ..

echo "Setup Complete"
