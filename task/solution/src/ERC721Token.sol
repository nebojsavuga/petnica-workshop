// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/// @title ERC721Token
/// @notice ERC721 token contract
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
    /// @notice Mint a new token
    /// @dev Only the owner can mint tokens
    /// @param to The address to mint the token to
    function mint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _mint(to, tokenId);
    }
}
