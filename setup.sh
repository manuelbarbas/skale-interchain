#!/bin/bash

set -eE

cd multisigwallet-cli

./scripts/prepare.sh

yarn install

cd ..

cd tokens

forge install

cd ..

chmod +x ./deploy_token.sh

echo "Setup Complete"
