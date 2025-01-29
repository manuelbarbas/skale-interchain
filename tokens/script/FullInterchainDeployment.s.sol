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
import {InterchainTUSD} from "../src/erc20Tokens/InterchainTUSD.sol";

import {EthereumERC20} from "../src/erc20Tokens/EthereumERC20.sol";

// DO NOT USE DIRECTLY
contract FullInterchainDeploymentScript is Script {
    
    string public name;
    string public symbol;
    uint8 public decimals;

    EthereumERC20 public ethereumERC20;
    InterchainERC20 public interchainERC20;
    InterchainERC20 public destinationERC20;
    InterchainERC20Wrapper public erc20Wrapper;

    event DeployERC20(string indexed name, string indexed symbol, uint8 indexed decimals);
    event DeployEthereumERC20(string indexed name, string indexed symbol, uint8 indexed decimals);
    event DeployWrapper(string indexed name, string indexed symbol, address indexed underlyingToken);

    bytes32 public constant DAI = keccak256(abi.encodePacked("DAI"));
    bytes32 public constant LINK = keccak256(abi.encodePacked("LINK"));
    bytes32 public constant SKL = keccak256(abi.encodePacked("SKL"));
    bytes32 public constant USDC = keccak256(abi.encodePacked("USDC"));
    bytes32 public constant USDP = keccak256(abi.encodePacked("USDP"));
    bytes32 public constant USDT = keccak256(abi.encodePacked("USDT"));
    bytes32 public constant WBTC = keccak256(abi.encodePacked("WBTC"));
    bytes32 public constant TUSD = keccak256(abi.encodePacked("TUSD"));

    function run(
        string memory tokenName,
        string memory interchainHub,
        string memory interchainDestination
    ) public {

        vm.createSelectFork(interchainHub);

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        bytes32 tokenNameHash = keccak256(abi.encodePacked(tokenName));

        if (tokenNameHash == DAI) interchainERC20 = new InterchainDAI();
        else if (tokenNameHash == LINK) interchainERC20 = new InterchainLINK();
        else if (tokenNameHash == SKL) interchainERC20 = new InterchainSKL();
        else if (tokenNameHash == USDC) interchainERC20 = new InterchainUSDC();
        else if (tokenNameHash == USDP) interchainERC20 = new InterchainUSDP();
        else if (tokenNameHash == USDT) interchainERC20 = new InterchainUSDT();
        else if (tokenNameHash == WBTC) interchainERC20 = new InterchainWBTC();
        else if (tokenNameHash == TUSD) interchainERC20 = new InterchainTUSD();
        else revert("Invalid Token Symbol");

        emit DeployERC20(interchainERC20.name(), interchainERC20.symbol(), interchainERC20.decimals());

        name = interchainERC20.name();
        symbol = interchainERC20.symbol();
        decimals = interchainERC20.decimals();

        erc20Wrapper = new InterchainERC20Wrapper(interchainERC20.name(), interchainERC20.symbol(), IERC20(address(interchainERC20)));
        emit DeployWrapper(erc20Wrapper.name(), erc20Wrapper.symbol(), address(interchainERC20));

        vm.stopBroadcast();

        if (keccak256(abi.encodePacked(interchainDestination)) != keccak256(abi.encodePacked("SKIP"))) {
            vm.createSelectFork(interchainDestination);
            vm.startBroadcast(deployerPrivateKey);
            if (tokenNameHash == DAI) destinationERC20 = new InterchainDAI();
            else if (tokenNameHash == LINK) destinationERC20 = new InterchainLINK();
            else if (tokenNameHash == SKL) destinationERC20 = new InterchainSKL();
            else if (tokenNameHash == USDC) destinationERC20 = new InterchainUSDC();
            else if (tokenNameHash == USDP) destinationERC20 = new InterchainUSDP();
            else if (tokenNameHash == USDT) destinationERC20 = new InterchainUSDT();
            else if (tokenNameHash == WBTC) destinationERC20 = new InterchainWBTC();
            else if (tokenNameHash == TUSD) destinationERC20 = new InterchainTUSD();
            else revert("Invalid Token Symbol");
            emit DeployERC20(destinationERC20.name(), destinationERC20.symbol(), destinationERC20.decimals());
            
            vm.stopBroadcast();
        }

        vm.createSelectFork("holesky");
        vm.startBroadcast(deployerPrivateKey);
        
        ethereumERC20 = new EthereumERC20(name, symbol, decimals);
        emit DeployEthereumERC20(ethereumERC20.name(), ethereumERC20.symbol(), ethereumERC20.decimals());

        vm.stopBroadcast();
    }
}
