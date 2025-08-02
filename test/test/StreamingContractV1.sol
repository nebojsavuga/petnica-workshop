// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {StreamingContractV1} from "../src/day-1/StreamingContractV1.sol";
import {IStreamingContractV1} from "../src/day-1/IStreamingContractV1.sol";

contract StreamingContractV1Test is Test {
    StreamingContractV1 public streamingContract;

    function setUp() external {
        streamingContract = new StreamingContractV1();
    }

    function test_deployment() external view {
        assertEq(streamingContract.id(), 0);
    }

    function test_createStream_revert_invalidRecipient() external {
        address recipient = address(0);
        uint256 startTime = block.timestamp + 1 days;
        uint256 endTime = startTime + 10 days;

        vm.expectRevert(IStreamingContractV1.AddressZero.selector);
        streamingContract.createStream(recipient, startTime, endTime);
    }

    function test_createStream_revert_invalidStartTime() external {
        // Set the current block.timestamp to a known value
        vm.warp(1000);
        address recipient = makeAddr("alice");
        uint256 startTime = 999;
        uint256 endTime = startTime + 10 days;
        vm.expectRevert(IStreamingContractV1.MustStartInFuture.selector);

        streamingContract.createStream(recipient, startTime, endTime);
    }

    function test_createStream_revert_invalidEndTime() external {
        vm.warp(1000);
        address recipient = makeAddr("alice");
        uint256 startTime = 1002;
        uint256 endTime = 1001;
        vm.expectRevert(IStreamingContractV1.InvalidInterval.selector);

        streamingContract.createStream(recipient, startTime, endTime);
    }

    function test_createStream_revert_zeroAmount() external {
        address recipient = makeAddr("alice");
        uint256 startTime = block.timestamp + 1 days;
        uint256 endTime = startTime + 10 days;

        vm.expectRevert(
            IStreamingContractV1.MustStreamAmountGreaterThanZero.selector
        );
        streamingContract.createStream{value: 0}(recipient, startTime, endTime);
    }

    function test_getStream() external {
        address recipient = makeAddr("alice");
        uint256 startTime = block.timestamp + 1 days;
        uint256 endTime = startTime + 10 days;
        uint256 amount = 1 ether;
        vm.deal(address(this), amount);
        uint256 streamId = streamingContract.createStream{value: amount}(
            recipient,
            startTime,
            endTime
        );
        StreamingContractV1.Stream memory stream = streamingContract.getStream(
            streamId
        );
        assertEq(stream.recipient, recipient);
        assertEq(stream.sender, address(this));
    }

    function test_calculateWithdrawalAmount() external {
        address recipient = makeAddr("alice");
        uint256 startTime = block.timestamp + 1 days;
        uint256 endTime = startTime + 10 days;
        uint256 amount = 6 ether;
        vm.deal(address(this), amount);

        uint256 streamId = streamingContract.createStream{value: amount}(
            recipient,
            startTime,
            endTime
        );

        // jump 5 days so we can get to half passed time
        vm.warp(startTime + 5 days);
        uint256 withdrawableAmount = streamingContract
            .calculateWithdrawableAmount(streamId);
        assertEq(withdrawableAmount, amount / 2);
    }

    function test_withdrawFromStream() external {
        address recipient = makeAddr("alice");
        uint256 startTime = block.timestamp + 1 days;
        uint256 endTime = startTime + 10 days;
        uint256 amount = 6 ether;
        vm.deal(address(this), amount);

        uint256 streamId = streamingContract.createStream{value: amount}(
            recipient,
            startTime,
            endTime
        );

        vm.warp(startTime + 5 days);

        streamingContract.withdrawFromStream(streamId);
        
        uint256 withdrawableAmount = streamingContract
            .calculateWithdrawableAmount(streamId);
        assertGt(withdrawableAmount, amount / 2);
        
    }

    function test_createStream() external {
        uint256 startTime = block.timestamp + 1 days;
        uint256 endTime = startTime + 7 days;
        uint256 amount = 1 ether;

        vm.deal(address(this), amount);
        uint256 streamId = streamingContract.createStream{value: amount}(
            address(this),
            startTime,
            endTime
        );

        StreamingContractV1.Stream memory stream = streamingContract.getStream(
            streamId
        );
        assertEq(stream.recipient, address(this));
        assertEq(stream.sender, address(this));
        assertEq(stream.startTime, startTime);
        assertEq(stream.endTime, endTime);
        assertEq(stream.totalAmount, amount);
        assertEq(stream.withdrawnAmount, 0);
    }
}
