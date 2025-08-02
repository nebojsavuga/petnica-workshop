pragma solidity 0.8.24;

import {IStreamingContractV1} from "./IStreamingContractV1.sol";
import {SafeERC20, IERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
using SafeERC20 for IERC20;

contract StreamingContractV1 is IStreamingContractV1 {
    uint256 public id;
    mapping(uint256 id => Stream stream) streams;

    // Create a new ETH stream (totalAmount comes from msg.value)
    function createStream(
        address recipient,
        uint256 startTime,
        uint256 endTime
    ) external payable returns (uint256 streamId) {
        if (recipient == address(0)) revert AddressZero();
        if (startTime < block.timestamp) revert MustStartInFuture();
        if (startTime >= endTime) revert InvalidInterval();
        if (msg.value == 0) revert MustStreamAmountGreaterThanZero();

        streamId = id;
        id++;

        streams[streamId] = Stream({
            recipient: recipient,
            sender: msg.sender,
            startTime: startTime,
            endTime: endTime,
            totalAmount: msg.value,
            withdrawnAmount: 0,
            tokenAddress: address(0),
            cancelled: false
        });

        emit StreamCreated(
            streamId,
            msg.sender,
            recipient,
            msg.value,
            startTime,
            endTime
        );
    }

    // Withdraw available funds from a stream
    function withdrawFromStream(uint256 streamId) external {
        Stream memory stream = streams[streamId];
        if (streamId >= id) revert InvalidStreamId();
        if (msg.sender != stream.recipient) revert Unauthorized();
        if (stream.totalAmount == stream.withdrawnAmount)
            revert AlreadyStreamed();

        uint256 withdrawableAmount = _calculateWithdrawableAmount(
            stream.startTime,
            stream.endTime,
            stream.totalAmount,
            stream.withdrawnAmount
        );

        if (withdrawableAmount == 0) revert ZeroToWithdraw();

        streams[streamId].withdrawnAmount += withdrawableAmount;

        if (streams[streamId].tokenAddress == address(0)) {
            (bool success, ) = stream.recipient.call{value: withdrawableAmount}(
                ""
            );
            require(success);
        } else {
            IERC20(stream.tokenAddress).safeTransfer(
                stream.recipient,
                withdrawableAmount
            );
        }

        emit Withdrawal(streamId, stream.recipient, withdrawableAmount);
    }

    // View stream details
    function getStream(uint256 streamId) external view returns (Stream memory) {
        return streams[streamId];
    }

    // Check withdrawable amount
    function calculateWithdrawableAmount(
        uint256 streamId
    ) external view returns (uint256) {
        if (streamId >= id) revert InvalidStreamId();
        Stream memory stream = streams[streamId];
        if (stream.totalAmount == stream.withdrawnAmount)
            revert AlreadyStreamed();
        return
            _calculateWithdrawableAmount(
                stream.startTime,
                stream.endTime,
                stream.totalAmount,
                stream.withdrawnAmount
            );
    }

    function _calculateWithdrawableAmount(
        uint256 startTime,
        uint256 endTime,
        uint256 totalAmount,
        uint256 withdrawnAmount
    ) internal view returns (uint256) {
        if (block.timestamp <= startTime) {
            return 0;
        } else if (block.timestamp > endTime) {
            return totalAmount - withdrawnAmount;
        } else {
            uint256 timeElapsed = block.timestamp - startTime;
            uint256 duration = endTime - startTime;
            return ((totalAmount * timeElapsed) / duration) - withdrawnAmount;
        }
    }

    function createTokenStream(
        address recipient,
        uint256 startTime,
        uint256 endTime,
        address tokenAddress,
        uint256 totalAmount
    ) external returns (uint256 streamId) {
        if (recipient == address(0)) revert AddressZero();
        if (tokenAddress == address(0)) revert AddressZero();
        if (startTime < block.timestamp) revert MustStartInFuture();
        if (startTime >= endTime) revert InvalidInterval();
        if (totalAmount == 0) revert MustStreamAmountGreaterThanZero();

        IERC20(tokenAddress).safeTransferFrom(
            msg.sender,
            address(this),
            totalAmount
        );

        streamId = id++;
        streams[streamId] = Stream({
            recipient: recipient,
            sender: msg.sender,
            startTime: startTime,
            endTime: endTime,
            totalAmount: totalAmount,
            withdrawnAmount: 0,
            tokenAddress: tokenAddress,
            canceled: false
        });

        emit StreamCreated(
            streamId,
            msg.sender,
            recipient,
            totalAmount,
            startTime,
            endTime
        );
    }
}
