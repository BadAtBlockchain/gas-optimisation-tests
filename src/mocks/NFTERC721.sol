// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTERC721 is ERC721 {
    address owner;
    uint256 counter;

    constructor() ERC721("Pretty Bad PFP", "BADPFP") {
        owner = msg.sender;
    }

    function mint(address _to) external {
        uint256 _tokenId = counter;
        counter += 1;
        
        _safeMint(_to, _tokenId);
    }
}