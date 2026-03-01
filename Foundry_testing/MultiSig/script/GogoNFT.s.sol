// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {GogoNFT} from "../src/GogoNFT.sol";

contract GogoNFTScript is Script {
	GogoNFT public gogonft;
    function run() external {
        vm.startBroadcast();
        gogonft = new GogoNFT();
        vm.stopBroadcast();
    }
}