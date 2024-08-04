// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {SupportChildren, ISupportChildren} from "../src/SupportChildren.sol";
import {Test, console} from "forge-std/Test.sol";

contract SupportChildrenTest is Test {
    SupportChildren supportChildren;

    function setUp() external {
        supportChildren = new SupportChildren();
    }

    function testCreateCampaign() external {
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
    function testCreateCampaignShouldEmitCampaignCreated() external {
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
    function testCreateCampaignAddressZero() external {
        vm.expectRevert(ISupportChildren.SupportChildren__AddressZero.selector);
        supportChildren.createCampaign(
            payable(address(0)),
            block.timestamp + 1 days,
            "uri",
            address(0),
            1
        );
    }
    function testCreateCampaignMustEndInFuture() external {
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
    function testCreateCampaignCapMustBeGreaterThanZero() external {
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
}
