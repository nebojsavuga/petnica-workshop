# Workshop Task: Smart Contract Development for Support Children Organization

## Background

Support Children is a non-profit, international organization dedicated to improving the lives of children worldwide. Recognizing the potential of cryptocurrency donations, they have decided to integrate this innovative approach into their fundraising efforts. You have been hired to develop the smart contract for organization.

## Objective

You are tasked with developing a smart contract that enables the creation of fundraising campaigns, accepting donations in Ethereum (ETH) and ERC-20 tokens, and rewarding donors with NFTs. This smart contract will adhere to the provided interface specifications.

## Requirements

1. **Campaign Creation**: The contract should allow the creation of fundraising campaigns with the following attributes:
    - Beneficiary address
    - End timestamp
    - URI for campaign details
    - Desired token for donations (ETH or ERC-20)
    - Hard cap for the maximum funds to be raised

2. **Donations**: The contract should accept donations in ETH and various ERC-20 tokens. It should ensure that donations are accurately recorded and that the hard cap is not exceeded.

3. **NFT Rewards**: Upon the first donation to a campaign, the donor should receive an NFT containing basic information about their contribution (e.g., campaign name, time, amount).

---

Example of the interface that contract should implement:

## Interface Specification

```solidity
pragma solidity 0.8.26;

interface ISupportChildren {
    struct Campaign {
        uint256 endTimestamp;
        address payable beneficiary;
        string uri;
        address wantToken;
        uint256 hardCap;
        uint256 receivedAmount;
        uint256 campaignId;
    }

    event CampaignCreated(uint256 campaignId, Campaign campaign);
    event Donation(uint256 campaignId, uint256 donatedAmountInWantToken, address tokenAddress);

    function isCampaignActive(uint256 _campaignId) external view returns (bool);

    function getCampaign(uint256 _campaignId)
        external
        view
        returns (Campaign memory);

    function createCampaign(
        address payable _beneficiary,
        uint256 _endTimestamp,
        string calldata uri,
        address wantToken,
        uint256 _hardCap
    ) external;

    // @params _donorToken assumed not to be ETH or WETH, for that use donateETH()
    function donate(
        uint256 _campaignId,
        address _donorToken,
        uint256 _amountInDonorTokens
    ) external;

    function donateETH(uint256 _campaignId) external payable;
}
```

## Development Guide

**Step 1: Basic Functionality with ETH Support**

Start by implementing the basic version of the smart contract that only supports donations in ETH.

1. **Campaign Creation**:
   - Beneficiary address
   - End timestamp
   - URI for campaign details
   - Desired token for donations (use `address(0)` for ETH)
   - Hard cap for the maximum funds to be raised

2. **ETH Donations**: Implement the function to accept and record ETH donations, ensuring the hard cap is not exceeded.

3. **Check Campaign Status**: Implement a function to check if a campaign is active.

**Step 2: Adding NFT Rewards**

Once the basic ETH donation functionality is working, add the feature to reward donors with NFTs.

1. **NFT Reward Creation**: Mint an NFT for the donor upon their first donation, containing basic information about the contribution.

2. **Integration with Donations**: Modify the donation function to include NFT minting and assignment.

**Step 3: Adding ERC-20 Token Support**

After implementing ETH donations and NFT rewards, extend the contract to support donations in various ERC-20 tokens.

1. **ERC-20 Token Donations**: Implement the function to accept and record ERC-20 token donations, ensuring the hard cap is not exceeded.

2. **Campaign Creation Update**: Modify the campaign creation function to accept an ERC-20 token address as the desired donation token.

### Summary

1. **Basic Version**: Support only ETH donations.
2. **NFT Rewards**: Add NFT rewards for donors.
3. **ERC-20 Support**: Extend to accept ERC-20 token donations.

## More advanced version
For an advanced version, the contract can be modified to allow users to send any ERC-20 token, and the Support Children organization will handle the swap between the sent token and the desired token for the campaign. For now, assume there is liquidity between tokens user send and campaign accepts.

To achieve this, you can use the Uniswap router to perform token swaps. This feature will make it easier for donors to contribute using any token they have, without worrying about the specific token the campaign requires.

---

**Inspired by [3327](https://3327.io)**