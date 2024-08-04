pragma solidity 0.8.26;

interface ISupportChildren {
    // @research, why this is not best defined struct
    // @hint struct packing
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
    event Donation(
        uint256 campaignId,
        uint256 donatedAmountInWantToken,
        address tokenAddress
    );

    error SupportChildren__CampaignMustEndInFuture();
    error SupportChildren__AddressZero();
    error SupportChildren__CapMustBeGreaterThanZero();
    error SupportChildren__CampaignNotActive();
    error SupportChildren__EthAmountMustBeGreaterThanZero();
    error SupportChildren__TokenAmountMustBeGreaterThanZero();
    error SupportChildren__CampaignCapIsReached();
    error SupportChildren__CampaignWantTokenIsNotETH();
    error SupportChildren__FailedToSendEther();
    error SupportChildren__CampaignWantTokenIsETH();
    error SupportChildren__TokenIsNotWantToken();

    function isCampaignActive(uint256 _campaignId) external view returns (bool);

    function getCampaign(
        uint256 _campaignId
    ) external view returns (Campaign memory);

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
