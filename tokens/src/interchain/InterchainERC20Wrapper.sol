// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ERC20Wrapper} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Wrapper.sol";

contract InterchainERC20Wrapper is ERC20Wrapper {
    constructor(string memory contractName, string memory contractSymbol, IERC20 originToken)
        ERC20Wrapper(originToken)
        ERC20(string.concat("Wrapped ", contractName), string.concat("w", contractSymbol))
    {}
}