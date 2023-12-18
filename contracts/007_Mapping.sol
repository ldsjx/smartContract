// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// 映射
contract Mapping {
    // 如果映射声明为public，那么Solidity会自动给你创建一个getter函数，可以通过Key来查询对应的Value。
    mapping(uint256 => address) public idToAddress; // id映射到地址
    mapping(address => address) public swapPair; // 币对的映射，地址到地址

    function writeMap(uint256 _Key, address _Value) public {
        idToAddress[_Key] = _Value;
    }

    function writeMapAddress(address _Key, address _Value) public {
        swapPair[_Key] = _Value;
    }

    // 规则1. _KeyType不能是自定义的 下面这个例子会报错
    // 我们定义一个结构体 Struct
    // struct Student{
    //    uint256 id;
    //    uint256 score;
    //} key 不可是结构体  构造函数
    // mapping(Struct => uint) public testVar;
}
