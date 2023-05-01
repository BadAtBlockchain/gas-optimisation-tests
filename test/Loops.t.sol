// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Loops.sol";
import "../src/mocks/NFTERC721.sol";

contract LoopsTest is Test {
    Loops public loops;

    // addresses
    address private owner = address(this);
    address private alice = address(0xface);
    address private bad = address(0xbad);

    function setUp() public {
        loops = new Loops();
    }

    function testLoop() public view {
        loops.loop1();
        loops.loop2();
        loops.loop3();
        loops.loop4();
        loops.loop5();
        loops.loop6();
        loops.loop7();
        loops.loop8();
    }

    function testOldVsNew() public {
        // create our Mock NFT
        vm.prank(bad);
        NFTERC721 nft = new NFTERC721();
        address nftAddr = address(nft);

        // empty loops just to get gas prices
        loops.loopOld();
        loops.loopNew();

        // alice calls old loop and mints
        vm.prank(alice);
        loops.loopOldAction(nftAddr);

        // bad calls new loop and mints
        vm.prank(bad);
        loops.loopNewAction(nftAddr);

        // confirm both end up with the same balance
        assertEq(nft.balanceOf(alice), 10);
        assertEq(nft.balanceOf(bad), 10);
    }
}
