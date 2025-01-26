// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// This a basic token that can live on testnet
contract EthereumERC20 is ERC20 {

    uint8 private _customDecimals;

    constructor(
        string memory name,
        string memory symbol,
        uint8 _decimals
    ) ERC20(name, symbol) {
       _customDecimals = _decimals;
       _mint(_msgSender(), 100_000_100 * 10 ** _decimals);
    }

    // Override the decimals() function
    function decimals() public view virtual override returns (uint8) {
        return _customDecimals;
    }
}
