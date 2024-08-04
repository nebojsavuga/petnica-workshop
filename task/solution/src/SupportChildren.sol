// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {ISupportChildren} from "./interfaces/ISupportChildren.sol";
import {IERC20} from "./interfaces/IERC20.sol";
import {IERC721} from "./interfaces/IERC721.sol";
import {ERC721Token} from "./ERC721Token.sol";

/// @title SupportChildren
/// @notice Contract for creating and donating to campaigns in ether or ERC20 tokens
contract SupportChildren is ISupportChildren {
    /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
    //////////////////////////////////////////////////////////////*/
    uint256 index; // @research, can this be more optimized?
    address public nftReward;
    mapping(uint256 campaignId => Campaign) campaigns;
    mapping(address receiver => mapping(uint256 campaignId => bool isNftRewardSent)) isNftRewardSent;

    constructor() {
        nftReward = address(new ERC721Token(address(this)));
    }

    /*//////////////////////////////////////////////////////////////
                           EXTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Check if a campaign is active
    /// @param _campaignId The id of the campaign
    /// @return bool True if the campaign is active, false otherwise
    function isCampaignActive(
        uint256 _campaignId
    ) external view returns (bool) {
        return _isCampaignActive(_campaignId);
    }

    /// @notice Get a campaign
    /// @param _campaignId The id of the campaign
    /// @return Campaign The campaign
    function getCampaign(
        uint256 _campaignId
    ) external view returns (Campaign memory) {
        return campaigns[_campaignId];
    }

    /// @notice Create a campaign
    /// @param _beneficiary The address of the beneficiary
    /// @param _endTimestamp The end timestamp of the campaign
    /// @param uri The URI of the campaign
    /// @param wantToken The address of the token the campaign wants
    /// @param _hardCap The hard cap of the campaign
    function createCampaign(
        address payable _beneficiary,
        uint256 _endTimestamp,
        string calldata uri,
        address wantToken,
        uint256 _hardCap
    ) external {
        _checkCampaignCreationParameters(_beneficiary, _endTimestamp, _hardCap);

        uint256 campaignId = index;
        Campaign memory campaign = Campaign(
            _endTimestamp,
            _beneficiary,
            uri,
            wantToken,
            _hardCap,
            0,
            campaignId
        );

        campaigns[campaignId] = campaign;
        index = campaignId + 1;

        emit CampaignCreated(campaignId, campaign);
    }

    /// @notice Donate ether to a campaign
    /// @param _campaignId The id of the campaign
    function donateETH(uint256 _campaignId) external payable {
        if (msg.value == 0) {
            revert SupportChildren__EthAmountMustBeGreaterThanZero();
        }
        // @dev, no need to check if campaign exist because endTimestamp will be 0 if campaign does not exist, which is always less than block.timestamp
        if (!_isCampaignActive(_campaignId)) {
            revert SupportChildren__CampaignNotActive();
        }

        Campaign memory campaign = campaigns[_campaignId];
        if (campaign.wantToken != address(0)) {
            revert SupportChildren__CampaignWantTokenIsNotETH();
        }
        if (campaign.receivedAmount + msg.value > campaign.hardCap) {
            revert SupportChildren__CampaignCapIsReached();
        }

        // Update the received amount, @research CEI pattern
        campaigns[_campaignId].receivedAmount += msg.value;
        // Send reward NFT if not sent before
        _sendRewardNFT(_campaignId, msg.sender);

        // Send the ether to the beneficiary
        (bool sent /* bytes memory data */, ) = campaign.beneficiary.call{
            value: msg.value
        }("");
        if (!sent) {
            revert SupportChildren__FailedToSendEther();
        }

        emit Donation(_campaignId, msg.value, address(0));
    }

    /// @notice Donate ERC20 token to a campaign
    /// @param _campaignId The id of the campaign
    /// @param _token The address of the token
    /// @param _amount The amount of the token
    function donate(
        uint256 _campaignId,
        address _token,
        uint256 _amount
    ) external {
        if (!_isCampaignActive(_campaignId)) {
            revert SupportChildren__CampaignNotActive();
        }
        if (_amount == 0) {
            revert SupportChildren__TokenAmountMustBeGreaterThanZero();
        }

        Campaign memory campaign = campaigns[_campaignId];
        if (campaign.wantToken == address(0)) {
            revert SupportChildren__CampaignWantTokenIsETH();
        }
        if (_token != campaign.wantToken) {
            revert SupportChildren__TokenIsNotWantToken();
        }
        if (campaign.receivedAmount + _amount > campaign.hardCap) {
            revert SupportChildren__CampaignCapIsReached();
        }

        address beneficiary = campaign.beneficiary;

        // Update the received amount, @research CEI pattern
        campaigns[_campaignId].receivedAmount += _amount;
        // Send reward NFT if not sent before
        _sendRewardNFT(_campaignId, msg.sender);

        // @hint, you need to approve the contract before calling this function
        IERC20(_token).transferFrom(msg.sender, beneficiary, _amount); // @research why this is not good practice
        emit Donation(_campaignId, _amount, _token);
    }

    /*//////////////////////////////////////////////////////////////
                           INTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/
    function _isCampaignActive(
        uint256 _campaignId
    ) internal view returns (bool) {
        return
            campaigns[_campaignId].endTimestamp > block.timestamp &&
            campaigns[_campaignId].hardCap >
            campaigns[_campaignId].receivedAmount;
    }

    function _checkCampaignCreationParameters(
        address _beneficiary,
        uint256 _endTimestamp,
        uint256 _hardCap
    ) internal view {
        if (_beneficiary == address(0)) {
            revert SupportChildren__AddressZero();
        }
        if (_endTimestamp <= block.timestamp) {
            revert SupportChildren__CampaignMustEndInFuture();
        }
        if (_hardCap == 0) {
            revert SupportChildren__CapMustBeGreaterThanZero();
        }
    }

    function _sendRewardNFT(uint256 campaignId, address _receiver) internal {
        bool isRewardSent = isNftRewardSent[_receiver][campaignId];
        if (!isRewardSent) {
            isNftRewardSent[_receiver][campaignId] = true;
            IERC721(nftReward).mint(_receiver);
        }
    }
}
