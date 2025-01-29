#!/usr/bin/env bash
set -ex

function _create_venv {
    if ls /usr/bin/python* | grep "python$1" > /dev/null; then
        python$1 -m venv venv
    fi
    return 0
}

versions=('3' '3.7' '3.8' '3.9' '3.10' '3.11')

for version in ${versions[@]}
do
    _create_venv $version
done

if [ ! -d "venv/" ] ; then
    echo "Setup failed. Unsupported version Python."
    exit 1
fi

source venv/bin/activate
python3 -m pip install wheel
python3 -m pip install -r scripts/requirements.txt
python3 scripts/generate_abi.py
if [ ! -d "skale-network" ] ; then
    git clone https://github.com/skalenetwork/skale-network.git
fi
STABLE_IMA_VERSION=$(ls skale-network/releases/mainnet/IMA/ | sort -r | head -n 1)
cp skale-network/releases/mainnet/IMA/$STABLE_IMA_VERSION/mainnet/abi.json data/ima_mainnet.json
rm -rf skale-network/
rm -rf venv/
