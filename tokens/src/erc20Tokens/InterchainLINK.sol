// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import {InterchainERC20} from "../interchain/InterchainERC20.sol";

contract InterchainLINK is InterchainERC20 {
    constructor() InterchainERC20("ChainLink Token", "LINK") {}
}
