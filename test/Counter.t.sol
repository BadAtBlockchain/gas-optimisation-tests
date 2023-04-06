// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testDiv() public {
        uint256 a = counter.test();
        assertEq(a, 5);
    }

    function testShift() public {
        uint256 a = counter.test2();
        assertEq(a, 5);
    }
}
