// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

interface IStreamingContractV1 {
    struct Stream {
        address recipient;
        address sender;
        uint256 startTime;
        uint256 endTime;
        uint256 totalAmount;
        uint256 withdrawnAmount;
    }

    event StreamCreated(
        uint256 indexed streamId,
        address indexed sender,
        address indexed recipient,
        uint256 totalAmount,
        uint256 startTime,
        uint256 endTime
    );
    
    event Withdrawal(
        uint256 indexed streamId,
        address indexed recipient,
        uint256 amount
    );

    // Create a new ETH stream (totalAmount comes from msg.value)
    function createStream(
        address recipient,
        uint256 startTime,
        uint256 endTime
    ) external payable returns (uint256);

    // Withdraw available funds from a stream
    function withdrawFromStream(uint256 streamId) external;

    // View stream details
    function getStream(uint256 streamId) external view returns (Stream memory);

    // Check withdrawable amount
    function calculateWithdrawableAmount(uint256 streamId) external view returns (uint256);
}

error StartTimeInvalid();
error AmountInvalid();

contract StreamCtr is IStreamingContractV1 {
    mapping(uint256 => Stream) public streams;
    uint256 private currentStreamId;
    
    constructor(){}

    function getStream(uint256 streamId) external view returns (Stream memory){
        return streams[streamId];
    }

    function getStreamTotalLeft(uint256 streamId) external view returns (uint256){
        Stream memory stream = streams[streamId];
        return stream.totalAmount - stream.withdrawnAmount;
    }

    function calculateWithdrawableAmount(uint256 streamId) external view returns (uint256){
        return _calculateWithdrawableAmount(streamId);
    }

     function _calculateWithdrawableAmount(uint256 streamId) private view returns (uint256){
        Stream memory stream = streams[streamId];
        if(stream.startTime > block.timestamp){
            revert StartTimeInvalid();
        }
        if(block.timestamp > stream.endTime){
            return stream.totalAmount - stream.withdrawnAmount;
        }

        uint256 elapsedTime = block.timestamp - stream.startTime;
        uint256 totalDuration = stream.endTime - stream.startTime;
        uint256 releaseAmount = (stream.totalAmount * elapsedTime) / totalDuration;

        if(stream.withdrawnAmount + releaseAmount > stream.totalAmount){
            revert AmountInvalid();
        }
        return releaseAmount - stream.withdrawnAmount;
    }

    function withdrawFromStream(uint256 streamId) external {
        uint256 amountToWithdraw = _calculateWithdrawableAmount(streamId);

        Stream storage stream = streams[streamId];
        stream.withdrawnAmount += amountToWithdraw;
        (bool success, ) = stream.recipient.call{ value: amountToWithdraw }("");

        require(success, "Withdraw failed.");
        emit Withdrawal(streamId, stream.recipient, amountToWithdraw);
    }

     function createStream(
        address recipient,
        uint256 startTime,
        uint256 endTime
    ) external payable returns (uint256){
        _validateDateTime(startTime, endTime);

        Stream memory stream = Stream(recipient, msg.sender, startTime, endTime, msg.value, 0);
        streams[currentStreamId++] = stream;

        emit StreamCreated(currentStreamId, msg.sender, recipient, msg.value, startTime, endTime);
        return currentStreamId-1;
    }

    function _validateDateTime(uint256 startTime, uint256 endTime) private view {
        if(startTime > endTime){
            revert StartTimeInvalid();
        }
        if(startTime > block.timestamp){
            revert StartTimeInvalid();
        }
    }
}