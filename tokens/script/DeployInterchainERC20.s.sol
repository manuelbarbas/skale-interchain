// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import {Script, console} from "forge-std/Script.sol";
import {InterchainERC20} from "../src/interchain/InterchainERC20.sol";

// DO NOT USE DIRECTLY
contract InterchainERC20Script is Script {
    InterchainERC20 public erc20;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        erc20 = new InterchainERC20("Interchain Token", "INT20");

        vm.stopBroadcast();
    }
}
