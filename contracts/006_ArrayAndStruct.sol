// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ArrayAndStruct {
    // 固定长度 Array
    uint256[8] array1;
    bytes1[5] array2;
    address[100] array3;

    // 可变长度 Array
    uint256[] array4;
    bytes1[] array5;
    address[] array6;
    bytes array7;

    // 初始化可变长度 Array
    uint256[] array8 = new uint256[](5);
    bytes array9 = new bytes(9);

    //  给可变长度数组赋值
    function initArray() external pure returns (uint256[] memory) {
        uint256[] memory x = new uint256[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;
        return (x);
    }

    //  给固定长度数组赋值
    function arrayPush() public returns (uint256[] memory) {
        uint256[2] memory a = [uint256(1), 2];
        array4 = a;
        array4.push(3);
        return array4;
        // 动态数组拥有push()成员，可以在数组最后添加一个0元素，并返回该元素的引用
        // array4.push();
        // 动态数组拥有pop()成员，可以移除数组最后一个元素。
        // array4.pop();
    }

    // 获取固定长度数组的长度
    function getArrayLength() public view returns (uint256) {
        return array4.length;
    }
}
