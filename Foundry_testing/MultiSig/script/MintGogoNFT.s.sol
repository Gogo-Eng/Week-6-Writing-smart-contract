// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {GogoNFT} from "../src/GogoNFT.sol";

contract MintGogoNFTScript is Script {
    function run() external {
        vm.startBroadcast();
        GogoNFT gogonft = GogoNFT(0xb21696963D75CDf5C125e7A4234F5A415eAaF1F1);
        gogonft.mint(0x7571707A5dF03406772508A1858DA3f94AE27C12, "https://ipfs.io/ipfs/bafkreiahk2hlswjfmjsec6nzacmh3yf4zb6cjskl2t7mf3osvf6ebyapay");
        vm.stopBroadcast();
    }
}