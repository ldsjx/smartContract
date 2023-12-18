// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

//变量初始值
contract InitialValue {
    bool public _bool; // false
    string public _string; // ""
    int256 public _int; // 0
    uint256 public _uint; // 0
    address public _address; // 0x0000000000000000000000000000000000000000

    function fi() internal {} // internal空白函数

    function fe() external {} // external空白函数

    enum ActionSet {
        Buy,
        Hold,
        Sell
    }

    ActionSet public _enum; // 声明为合约状态变量,第1个内容Buy的索引0

    constructor() {
        _enum = ActionSet.Sell; // 设置 _enum 为 Hold
    }

    function test() external view returns (uint256) {
        return uint256(_enum);
    }

    bytes1 public _bytes1;
    // 引用类型
    uint256[8] public _staticArray; // 所有成员设为其默认值的静态数组[0,0,0,0,0,0,0,0]
    uint256[] public _dynamicArray; // `[]`
    mapping(uint256 => address) public _mapping; // 所有元素都为其默认值的mapping
    // 所有成员设为其默认值的结构体 0, 0
    struct Student {
        uint256 id;
        uint256 score;
    }
    Student public student;

    // delete操作符
    bool public _bool2 = true;

    function d() external {
        delete _bool2; // delete 会让_bool2变为默认值，false
    }
}
