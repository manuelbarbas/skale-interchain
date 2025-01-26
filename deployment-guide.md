# Deployment Guide

## Installation

1. Run `./setup.sh` from the base of the GitHub repo. If this fails,
it means you are missing one of the key dependencies like Python, Node, Rust, etc.

2. Select the token you want to deploy from the list below OR 
update the repo to add your token. If updating to add a new token,
please fork, clone, and make a PR.

3. Available Tokens 

- DAI
- LINK
- SKL
- USDC
- USDP
- USDT
- WBTC

4. Available Chains

**Mainnet**
- calypso
- europa
- nebula
- titan

**Testnet*
- calypso_testnet
- europa_testnet
- nebula_testnet
- titan_testnet

5. Run Deployment Script

Run:

```shell
./deploy_token.sh <token> <hub_chain> <destination_chain>
```

- Token - should be from Step 3. Make sure it's all caps.
- Hub Chain - this will generally be europa or europa_testnet. It's where the wrapper is deployed
- Destination Chain - this is generally going to be Calypso, Nebula, Titan, or an AppChain. It's a chain that is
sourcing liquidity from Europa