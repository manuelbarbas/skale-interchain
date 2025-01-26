// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {InterchainERC20} from "../src/interchain/InterchainERC20.sol";
import {InterchainERC20Wrapper} from "../src/interchain/InterchainERC20Wrapper.sol";

import {InterchainDAI} from "../src/erc20Tokens/InterchainDAI.sol";
import {InterchainLINK} from "../src/erc20Tokens/InterchainLINK.sol";
import {InterchainSKL} from "../src/erc20Tokens/InterchainSKL.sol";
import {InterchainUSDC} from "../src/erc20Tokens/InterchainUSDC.sol";
import {InterchainUSDP} from "../src/erc20Tokens/InterchainUSDP.sol";
import {InterchainUSDT} from "../src/erc20Tokens/InterchainUSDT.sol";
import {InterchainWBTC} from "../src/erc20Tokens/InterchainWBTC.sol";

// DO NOT USE DIRECTLY
contract InterchainERC20Script is Script {
    
    InterchainERC20 public erc20;
    InterchainERC20Wrapper public wrapper;

    event DeployERC20(string indexed name, string indexed symbol, uint8 indexed decimals);
    event DeployWrapper(string indexed name, string indexed symbol, address indexed underlyingToken);

    bytes32 public constant DAI = keccak256(abi.encodePacked("DAI"));
    bytes32 public constant LINK = keccak256(abi.encodePacked("LINK"));
    bytes32 public constant SKL = keccak256(abi.encodePacked("SKL"));
    bytes32 public constant USDC = keccak256(abi.encodePacked("USDC"));
    bytes32 public constant USDP = keccak256(abi.encodePacked("USDP"));
    bytes32 public constant USDT = keccak256(abi.encodePacked("USDT"));
    bytes32 public constant WBTC = keccak256(abi.encodePacked("WBTC"));

    function run(
        string memory tokenName,
        bool deployWrapper
    ) public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        bytes32 tokenNameHash = keccak256(abi.encodePacked(tokenName));

        if (tokenNameHash == DAI) erc20 = new InterchainDAI();
        else if (tokenNameHash == LINK) erc20 = new InterchainLINK();
        else if (tokenNameHash == SKL) erc20 = new InterchainSKL();
        else if (tokenNameHash == USDC) erc20 = new InterchainUSDC();
        else if (tokenNameHash == USDP) erc20 = new InterchainUSDP();
        else if (tokenNameHash == USDT) erc20 = new InterchainUSDT();
        else if (tokenNameHash == WBTC) erc20 = new InterchainWBTC();
        else revert("Invalid Token Symbol");

        emit DeployERC20(erc20.name(), erc20.symbol(), erc20.decimals());

        if (deployWrapper) {
            wrapper = new InterchainERC20Wrapper(erc20.name(), erc20.symbol(), IERC20(address(erc20)));
            emit DeployWrapper(wrapper.name(), wrapper.symbol(), address(erc20));
        }

        vm.stopBroadcast();
    }
}
