// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {GogoNFT} from "../src/GogoNFT.sol";

contract GogoNFTTest is Test {
    GogoNFT nft;
    address user =address(1);

    function setUp() public {
        nft = new GogoNFT("ipfs://test/");
    }

    function testMintNFT() public {
        nft.mint(user);
        assertEq(nft.ownerOf(1), user);
    }
    function testOnlyOnerCanMint() public {
        vm.prank(user);
        vm.expectRevert();
        nft.mint(user);
    }
}