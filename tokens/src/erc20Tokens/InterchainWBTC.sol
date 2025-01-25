// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {InterchainERC20} from "../interchain/InterchainERC20.sol";

contract InterchainWBTC is InterchainERC20 {
    constructor() InterchainERC20("Wrapped BTC", "WBTC") {}

    function decimals() public view override returns (uint8) {
        return 8;
    }
}
