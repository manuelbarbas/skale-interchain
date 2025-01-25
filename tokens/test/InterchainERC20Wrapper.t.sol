// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {InterchainERC20} from "../src/interchain/InterchainERC20.sol";
import {InterchainERC20Wrapper} from "../src/interchain/InterchainERC20Wrapper.sol";

contract InterchainERC20Test is Test {
    InterchainERC20 public erc20;
    InterchainERC20Wrapper public wrapper;

    function setUp() public {
        erc20 = new InterchainERC20("Interchain Token", "INT20");
        wrapper = new InterchainERC20Wrapper(erc20.name(), erc20.symbol(), IERC20(address(erc20)));
    }

    function test_Name() public view {
        assertEq(erc20.name(), "Interchain Token");
        assertEq(wrapper.name(), "Wrapped Interchain Token");
    }

    function test_Symbol() public view {
        assertEq(erc20.symbol(), "INT20");
        assertEq(wrapper.symbol(), "wINT20");
    }

    function test_Decimal() public view {
        assertEq(erc20.decimals(), 18);
        assertEq(wrapper.decimals(), 18);
    }
}
