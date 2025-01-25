// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {InterchainERC20} from "../interchain/InterchainERC20.sol";

contract InterchainUSDT is InterchainERC20 {
    constructor() InterchainERC20("Tether USD", "USDT") {}

    function decimals() public view override returns (uint8) {
        return 6;
    }
}
