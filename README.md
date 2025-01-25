# SKALE IMA Monorepo

This repo is a monorepo focused on managing and using common IMA functionality.
The IMA Smart Contracts can be found [here](https://github.com/skalenetwork/ima).
This repo also contains a slightly modified [multisigwallet-cli](/multisigwallet-cli) to make it simpler for new developers to get up and running with the proper tools.

## Getting Started

Start by making sure you have the following installed on your system:

- One of the Python verisons: 3.7, 3.8, 3.9, 3.10, 3.11
- Rust
- Node.js & NPM
- Yarn (Optional): Will be enabled automatically if you don't have it

Run the following command:

```shell
chmod +x && ./setup.sh
```

This command will:

1. Setup multisigwallet-cli so that multisigwallet transaction data can properly be prepared
2. Setup the smart contract repo for the tokens
