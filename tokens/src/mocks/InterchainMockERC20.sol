// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {InterchainERC20} from "../interchain/InterchainERC20.sol";

contract InterchainMockERC20 is InterchainERC20 {
    constructor() InterchainERC20("Interchain Token", "INT20") {
        _mint(_msgSender(), 100_000_000 * 10 ** 18);
    }
}