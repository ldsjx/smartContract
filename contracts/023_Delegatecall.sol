// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract A {
    uint256 public numA;

    function callB(address _addr, uint256 _num) external {
        // call合约B的setVars()函数，改变合约B的状态
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success, "Call to B failed");

        // 这里numA不受影响，上下文仍为合约A
        numA = _num;
    }

    function delegatecallB(address _addr, uint256 _num) external {
        // delegatecall合约B的setVars()函数，改变合约A的状态
        (bool success, bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success, "Delegatecall to B failed");

        // 这里numA会被改变，上下文为合约A
        numA = _num;
    }
}

contract B {
    uint256 public numB;

    function setVars(uint256 _num) public {
        // call调用 合约B的状态变量numB会被改变
        // delegatecall调用 合约A的状态变量numA会被改变，因为是delegatecall
        numB = _num;
    }
}
