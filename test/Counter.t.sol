// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testDivision() public {
        uint256 a = counter.basicDivision();
        assertEq(a, 5);
    }

    function testBitShift() public {
        uint256 a = counter.shiftDivision();
        assertEq(a, 5);
    }
}
