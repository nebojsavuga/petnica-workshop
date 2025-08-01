// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title ERC20Token
contract ERC20Token is ERC20 {
    constructor() ERC20("ERC20Token", "ERC20Token") {}

    /// @notice Mint new tokens
    /// @dev Anyone can mint tokens
    /// @param to The address to mint the tokens to
    /// @param amount The amount of tokens to mint
    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
