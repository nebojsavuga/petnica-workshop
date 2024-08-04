// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ERC721Token is ERC721 {
    uint256 private _nextTokenId;
    address owner;

    error ERC721Token__NotOwner();

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert ERC721Token__NotOwner();
        }
        _;
    }

    constructor(address initialOwner) ERC721("ERC721Token", "ERC721Token") {
        owner = initialOwner;
    }

    function mint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _mint(to, tokenId);
    }
}
