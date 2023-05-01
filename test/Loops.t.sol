// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Loops.sol";

contract LoopsTest is Test {
    Loops public loops;

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
    }

    function testOldVsNew() public view {
        loops.loopOld();
        loops.loopNew();
    }
}
