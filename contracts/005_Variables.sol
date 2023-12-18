// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Variables {
    uint256 public x = 1;
    uint256 public y;
    string public z;

    function foo() external {
        // 在 external 函数中可以修改状态变量的值
        x = 5;
        y = 2;
        z = "0xAA";
    }

    // 获取x,y,z的值
    function getValues()
        external
        view
        returns (
            uint256,
            uint256,
            string memory
        )
    {
        return (x, y, z);
    }

    function global()
        external
        view
        returns (
            address,
            uint256,
            bytes memory
        )
    {
        address sender = msg.sender;
        uint256 blockNum = block.number;
        bytes memory data = msg.data;
        return (sender, blockNum, data);
    }

    function weiUnit() external pure returns (uint256) {
        assert(1 wei == 1e0);
        assert(1 wei == 1);
        return 1 wei;
    }

    function gweiUnit() external pure returns (uint256) {
        assert(1 gwei == 1e9);
        assert(1 gwei == 1000000000);
        return 1 gwei;
    }

    function etherUnit() external pure returns (uint256) {
        assert(1 ether == 1e18);
        assert(1 ether == 1000000000000000000);
        return 1 ether;
    }

    function secondsUnit() external pure returns (uint256) {
        assert(1 seconds == 1);
        return 1 seconds;
    }

    function minutesUnit() external pure returns (uint256) {
        assert(1 minutes == 60);
        assert(1 minutes == 60 seconds);
        return 1 minutes;
    }

    function hoursUnit() external pure returns (uint256) {
        assert(1 hours == 3600);
        assert(1 hours == 60 minutes);
        return 1 hours;
    }

    function daysUnit() external pure returns (uint256) {
        assert(1 days == 86400);
        assert(1 days == 24 hours);
        return 1 days;
    }

    function weeksUnit() external pure returns (uint256) {
        assert(1 weeks == 604800);
        assert(1 weeks == 7 days);
        return 1 weeks;
    }
}