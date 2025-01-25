// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {InterchainERC20} from "../interchain/InterchainERC20.sol";

contract InterchainUSDP is InterchainERC20 {
    constructor() InterchainERC20("PAX Dollar ", "USDP") {}
}
