// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract DeleteContract {
    uint256 public value = 10;

    constructor() payable {}

    receive() external payable {}

    fallback() external payable {}

    function deleteContract() external {
        // 调用selfdestruct销毁合约，并把剩余的ETH转给msg.sender
        selfdestruct(payable(msg.sender));
    }

    function getBalance() external view returns (uint256 balance) {
        balance = address(this).balance;
    }
}
