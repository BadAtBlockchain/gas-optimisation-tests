// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function test() public returns (uint256) {
        uint256 t = 10 / 2;
        return t;
    }

    function test2() public returns (uint256) {
        uint256 t = 10 >> 1;
        return t;
    }
}
