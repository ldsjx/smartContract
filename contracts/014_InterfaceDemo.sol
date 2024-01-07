// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// 抽象接口
interface InterfaceDemo {
    function getFirstName() external pure returns (string memory);

    function getLastName() external pure returns (string memory);
}

contract BaseImpl is InterfaceDemo {
    function getFirstName() external pure override returns (string memory) {
        return "Amazing";
    }

    function getLastName() external pure override returns (string memory) {
        return "Ang";
    }
}
