// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {InterchainERC20} from "../src/interchain/InterchainERC20.sol";

contract InterchainERC20Test is Test {
    InterchainERC20 public erc20;

    function setUp() public {
        erc20 = new InterchainERC20("Interchain Token", "INT20");
    }

    function test_Name() public view {
        assertEq(erc20.name(), "Interchain Token");
    }

    function test_Symbol() public view {
        assertEq(erc20.symbol(), "INT20");
    }

    function test_Decimal() public view {
        assertEq(erc20.decimals(), 18);
    }

    function testFail_Mint() public {
        erc20.mint(address(0x0), 1000);
    }

    function testFail_Burn() public {
        erc20.burn(1000);
    }
}
