// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {SupportChildren, ISupportChildren, IERC721, IERC20} from "../src/SupportChildren.sol";
import {ERC20Token} from "../src/ERC20Token.sol";
import {Test, console} from "forge-std/Test.sol";

contract SupportChildrenTest is Test {
    SupportChildren supportChildren;
    ERC20Token testToken;

    function setUp() external {
        supportChildren = new SupportChildren();
        testToken = new ERC20Token();
    }

    /*//////////////////////////////////////////////////////////////
                            CREATE CAMPAIGN
    //////////////////////////////////////////////////////////////*/
    function test_CreateCampaign() external {
        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp + 1 days,
            "uri",
            address(0),
            1
        );

        ISupportChildren.Campaign memory campaign = supportChildren.getCampaign(
            0
        );
        assertEq(campaign.endTimestamp, block.timestamp + 1 days);
        assertEq(campaign.beneficiary, address(this));
        assertEq(campaign.uri, "uri");
        assertEq(campaign.wantToken, address(0));
        assertEq(campaign.hardCap, 1);
        assertEq(campaign.receivedAmount, 0);
        assertEq(campaign.campaignId, 0);

        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp + 1 days,
            "uri",
            makeAddr("tokenAddress"),
            1
        );

        campaign = supportChildren.getCampaign(1);
        assertEq(campaign.endTimestamp, block.timestamp + 1 days);
        assertEq(campaign.beneficiary, address(this));
        assertEq(campaign.uri, "uri");
        assertEq(campaign.wantToken, makeAddr("tokenAddress"));
        assertEq(campaign.hardCap, 1);
        assertEq(campaign.receivedAmount, 0);
        assertEq(campaign.campaignId, 1);
    }
    function test_CreateCampaignShouldEmitCampaignCreated() external {
        vm.expectEmit(true, true, true, true, address(supportChildren));
        emit ISupportChildren.CampaignCreated(
            0,
            ISupportChildren.Campaign({
                endTimestamp: block.timestamp + 1 days,
                beneficiary: payable(address(this)),
                uri: "uri",
                wantToken: address(0),
                hardCap: 1,
                receivedAmount: 0,
                campaignId: 0
            })
        );

        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp + 1 days,
            "uri",
            address(0),
            1
        );
    }
    function test_CreateCampaignAddressZero() external {
        vm.expectRevert(ISupportChildren.SupportChildren__AddressZero.selector);
        supportChildren.createCampaign(
            payable(address(0)),
            block.timestamp + 1 days,
            "uri",
            address(0),
            1
        );
    }
    function test_CreateCampaignMustEndInFuture() external {
        vm.warp(block.timestamp + 1 days);
        vm.expectRevert(
            ISupportChildren.SupportChildren__CampaignMustEndInFuture.selector
        );
        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp - 1 days,
            "uri",
            address(0),
            1
        );
    }
    function test_CreateCampaignCapMustBeGreaterThanZero() external {
        vm.expectRevert(
            ISupportChildren.SupportChildren__CapMustBeGreaterThanZero.selector
        );
        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp + 1 days,
            "uri",
            address(0),
            0
        );
    }

    /*//////////////////////////////////////////////////////////////
                               DONATE ETH
    //////////////////////////////////////////////////////////////*/
    function test_DonateEth() external {
        address payable receiver = payable(makeAddr("beneficiary"));
        uint256 etherBalanceBefore = receiver.balance;
        uint256 balanceBefore = IERC721(supportChildren.nftReward()).balanceOf(
            receiver
        );
        supportChildren.createCampaign(
            receiver,
            block.timestamp + 1 days,
            "uri",
            address(0),
            1 ether
        );

        vm.deal(receiver, 1 ether);
        vm.prank(receiver);
        supportChildren.donateETH{value: 1 ether}(0);

        uint256 balanceAfter = IERC721(supportChildren.nftReward()).balanceOf(
            receiver
        );

        ISupportChildren.Campaign memory campaign = supportChildren.getCampaign(
            0
        );
        assertEq(campaign.receivedAmount, 1 ether);
        assertEq(balanceAfter, balanceBefore + 1);
        assertEq(receiver.balance, etherBalanceBefore + 1 ether);
    }
    function test_DonateEthMintsOnlyOneNFTPerCampaign() external {
        address payable receiver = payable(makeAddr("beneficiary"));
        uint256 balanceBefore = IERC721(supportChildren.nftReward()).balanceOf(
            receiver
        );
        supportChildren.createCampaign(
            receiver,
            block.timestamp + 1 days,
            "uri",
            address(0),
            2 ether
        );

        vm.deal(receiver, 2 ether);

        vm.startPrank(receiver);
        supportChildren.donateETH{value: 1 ether}(0);
        supportChildren.donateETH{value: 1 ether}(0);
        vm.stopPrank();

        uint256 balanceAfter = IERC721(supportChildren.nftReward()).balanceOf(
            receiver
        );

        ISupportChildren.Campaign memory campaign = supportChildren.getCampaign(
            0
        );
        assertEq(campaign.receivedAmount, 2 ether);
        assertEq(balanceAfter, balanceBefore + 1);
    }
    function test_DonateEthCampaignNotActive() external {
        vm.expectRevert(
            ISupportChildren.SupportChildren__CampaignNotActive.selector
        );
        supportChildren.donateETH{value: 1 ether}(0);
    }
    function test_DonateEthCampaignWantTokenIsNotEth() external {
        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp + 1 days,
            "uri",
            makeAddr("tokenAddress"),
            1
        );
        vm.expectRevert(
            ISupportChildren.SupportChildren__CampaignWantTokenIsNotETH.selector
        );
        supportChildren.donateETH{value: 1 ether}(0);
    }
    function test_DonateEthCampaignCapIsReached() external {
        supportChildren.createCampaign(
            payable(makeAddr("beneficiary")),
            block.timestamp + 1 days,
            "uri",
            address(0),
            1 ether
        );
        supportChildren.donateETH{value: 0.5 ether}(0);
        vm.expectRevert(
            ISupportChildren.SupportChildren__CampaignCapIsReached.selector
        );
        supportChildren.donateETH{value: 0.6 ether}(0);
    }
    function test_DonateEthEthAmountMustBeGreaterThanZero() external {
        vm.expectRevert(
            ISupportChildren
                .SupportChildren__EthAmountMustBeGreaterThanZero
                .selector
        );
        supportChildren.donateETH{value: 0}(0);
    }
    function test_DonateEthFailedToSendEther() external {
        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp + 1 days,
            "uri",
            address(0),
            1 ether
        );
        vm.expectRevert(
            ISupportChildren.SupportChildren__FailedToSendEther.selector
        );
        supportChildren.donateETH{value: 1 ether}(0);
    }

    /*//////////////////////////////////////////////////////////////
                                 DONATE
    //////////////////////////////////////////////////////////////*/
    function test_donate() external {
        address caller = makeAddr("caller");
        address receiver = makeAddr("beneficiary");
        testToken.mint(caller, 100);

        vm.startPrank(caller);
        testToken.approve(address(supportChildren), 100);

        uint256 tokenBalanceBefore = testToken.balanceOf(receiver);
        uint256 balanceBefore = IERC721(supportChildren.nftReward()).balanceOf(
            payable(caller)
        );
        supportChildren.createCampaign(
            payable(receiver),
            block.timestamp + 1 days,
            "uri",
            address(testToken),
            100
        );

        supportChildren.donate(0, address(testToken), 100);

        vm.stopPrank();

        uint256 balanceAfter = IERC721(supportChildren.nftReward()).balanceOf(
            payable(caller)
        );

        ISupportChildren.Campaign memory campaign = supportChildren.getCampaign(
            0
        );
        assertEq(campaign.receivedAmount, 100);
        assertEq(balanceAfter, balanceBefore + 1);
        assertEq(testToken.balanceOf(receiver), tokenBalanceBefore + 100);
    }
    function test_donateMintsOnlyOneNFTPerCampaign() external {
        address caller = makeAddr("caller");
        address receiver = makeAddr("beneficiary");
        testToken.mint(caller, 200);

        vm.startPrank(caller);
        testToken.approve(address(supportChildren), 200);

        uint256 balanceBefore = IERC721(supportChildren.nftReward()).balanceOf(
            payable(caller)
        );
        supportChildren.createCampaign(
            payable(receiver),
            block.timestamp + 1 days,
            "uri",
            address(testToken),
            200
        );

        supportChildren.donate(0, address(testToken), 100);
        supportChildren.donate(0, address(testToken), 100);

        vm.stopPrank();

        uint256 balanceAfter = IERC721(supportChildren.nftReward()).balanceOf(
            payable(caller)
        );

        ISupportChildren.Campaign memory campaign = supportChildren.getCampaign(
            0
        );
        assertEq(campaign.receivedAmount, 200);
        assertEq(balanceAfter, balanceBefore + 1);
    }
    function test_donateCampaignNotActive() external {
        vm.expectRevert(
            ISupportChildren.SupportChildren__CampaignNotActive.selector
        );
        supportChildren.donate(0, makeAddr("tokenAddress"), 1);
    }
    function test_donateCampaignWantTokenIsEth() external {
        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp + 1 days,
            "uri",
            address(0),
            1
        );
        vm.expectRevert(
            ISupportChildren.SupportChildren__CampaignWantTokenIsETH.selector
        );
        supportChildren.donate(0, makeAddr("tokenAddress"), 1);
    }
    function test_donateCampaignTokenIsNotWantToken() external {
        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp + 1 days,
            "uri",
            makeAddr("tokenAddress"),
            1
        );
        vm.expectRevert(
            ISupportChildren.SupportChildren__TokenIsNotWantToken.selector
        );
        supportChildren.donate(0, makeAddr("tokenAddressWrong"), 1);
    }
    function test_CampaignCapIsReached() external {
        supportChildren.createCampaign(
            payable(makeAddr("beneficiary")),
            block.timestamp + 1 days,
            "uri",
            makeAddr("tokenAddress"),
            1
        );
        vm.expectRevert(
            ISupportChildren.SupportChildren__CampaignCapIsReached.selector
        );
        supportChildren.donate(0, makeAddr("tokenAddress"), 10);
    }
    /*//////////////////////////////////////////////////////////////
                           IS CAMPAIGN ACTIVE
    //////////////////////////////////////////////////////////////*/
    function test_IsCampaignActive() external {
        supportChildren.createCampaign(
            payable(address(this)),
            block.timestamp + 1 days,
            "uri",
            address(0),
            1
        );
        assert(supportChildren.isCampaignActive(0));

        vm.warp(block.timestamp + 2 days);
        assert(!supportChildren.isCampaignActive(0));

        address receiver = makeAddr("beneficiary");
        supportChildren.createCampaign(
            payable(receiver),
            block.timestamp + 1 days,
            "uri",
            address(0),
            1 ether
        );
        assert(supportChildren.isCampaignActive(1));

        // after cap is reached campaign is not active
        vm.deal(receiver, 1 ether);
        vm.prank(receiver);
        supportChildren.donateETH{value: 1 ether}(1);
        assert(!supportChildren.isCampaignActive(1));
    }
}
