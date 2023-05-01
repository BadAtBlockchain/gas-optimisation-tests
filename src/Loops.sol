// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./mocks/NFTERC721.sol";

contract Loops {
    // Note: standard, normal loop definition
    function loop1() public pure {
        uint256 x = 0;
        for (uint256 i = 0; i < 1000; i++) {
            x = i;
        }
        require (x == 999);
    }

    // Note: standard loop, but we ++i instead of i++
    function loop2() public pure {
        uint256 x = 0;
        for (uint256 i = 0; i < 1000; ++i) {
            x = i;
        }
        require (x == 999);
    }

    // Note: we don't set i = 0 in the loop
    function loop3() public pure {
        uint256 x = 0;
        for (uint256 i; i < 1000; ++i) {
            x = i;
        }
        require (x == 999);
    }

    // Note: ++i within an unchecked block
    function loop4() public pure {
        uint256 x = 0;
        for (uint256 i; i < 1000;) {
            x = i;

            unchecked {
                ++i;
            }
        }
        require (x == 999);
    }

    // Note: pull the uint256 out of the for loop altogether
    function loop5() public pure {
        uint256 x = 0;
        uint256 i;

        for (; i < 1000;) {
            x = i;

            unchecked {
                ++i;
            }
        }
        require (x == 999);
    }

    // Note: Convert to a 'do while'
    function loop6() public pure {
        uint256 x = 0;
        uint256 i;
        
        do {
            x = i;
            unchecked {
                ++i;
            }
        } while(i < 1000);

        require (x == 999);
    }

    // Note: we are actually more expensive here despite trying to go lower level...
    function loop7() public pure {
        assembly {
            let x := 0
            let i := 0

            for { i := 0 } lt(i, 1000) { i := add(i, 1) } {
                x := i
            }
        }
    }

    // Let's actually do something
    function loopOld() public {
        for (uint256 i = 0; i < 10; i++) {
        }
    }

    function loopOldAction(address _addr) public {
        for (uint256 i = 0; i < 10; i++) {
            NFTERC721(_addr).mint(msg.sender);
        }
    }

    function loopNew() public {
        uint256 i;
        
        do {
            unchecked {
                ++i;
            }
        } while(i < 10);
    }

    function loopNewAction(address _addr) public {
        uint256 i;
        
        do {
            NFTERC721(_addr).mint(msg.sender);

            unchecked {
                ++i;
            }
        } while(i < 10);
    }
}
