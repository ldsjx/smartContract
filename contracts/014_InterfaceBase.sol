// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// 抽象接口
abstract contract InterfaceBase {
    string public name = "Base";

    function getAlias() public pure virtual returns (string memory);
}

contract BaseImpl is InterfaceBase {
    function getAlias() public pure override returns (string memory) {
        return "BaseImpl";
    }
}
