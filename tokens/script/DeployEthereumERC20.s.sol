// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {EthereumERC20} from "../src/erc20Tokens/EthereumERC20.sol";

// DO NOT USE DIRECTLY
contract EthereumERC20Script is Script {
    
    EthereumERC20 public token;

    function run(
        string memory name,
        string memory symbol,
        uint8 decimals
    ) public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        token = new EthereumERC20(name, symbol, decimals);

        vm.stopBroadcast();
    }
}
